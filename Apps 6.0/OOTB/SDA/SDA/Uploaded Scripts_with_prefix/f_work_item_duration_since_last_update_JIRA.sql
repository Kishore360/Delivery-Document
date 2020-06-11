SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.duration_since_last_update' ELSE 'SUCCESS' END as Message
 
 FROM #MDS_TABLE_SCHEMA.issue_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 JOIN (SELECT MAX(lastupdated) as lastupdated, source_id FROM #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id ) dat
 on TRGT.source_id = dat.source_id
 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on concat('STATUS~WORK_ITEM~',upper(SRC.statusid))=DM.src_rowid and SRC.sourceinstance = DM.source_id
 
 WHERE COALESCE(case when DM.dimension_wh_code in ('COMPLETED', 'RESOLVED', 'CANCELLED') then 0
 else timestampdiff(second, SRC.updated, convert_tz(dat.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) end, 0)<> COALESCE(TRGT.duration_since_last_update,'');