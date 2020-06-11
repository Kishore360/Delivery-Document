SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 then case when (COALESCE(case when LM.dimension_wh_code in ('COMPLETED', 'RESOLVED') and RES.dimension_wh_code in ('CANCELLED') then 0 
when LM.dimension_wh_code in ('COMPLETED', 'RESOLVED') and SRC.created is not null
then timestampdiff(second, SRC.created, COALESCE(SRC.resolutiondate, compltd_dt.work_complete_on)) else 0 end, '') - COALESCE(TRGT.duration_created_to_resolved,'')) in (-3600, 3600) 
 then 'Failing due to timezone conversion issue for f_work_item.duration_created_to_resolved'
 ELSE  'MDS to DWH data validation failed for f_work_item.duration_created_to_resolved' END ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 left join (
select tmp.issueid,tmp.sourceinstance,max(tmp.created) as work_complete_on
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id
 
where lower(tmp.field) = 'status' and LM.dimension_wh_code='COMPLETED' and tmp.primary_sequence_id <>0
group by tmp.issueid,tmp.sourceinstance
) compltd_dt
on SRC.id=compltd_dt.issueid
and SRC.sourceinstance=compltd_dt.sourceinstance

left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(SRC.status_id))=LM.src_rowid

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.resolution_id))=RES.src_rowid and SRC.sourceinstance = RES.source_id

 WHERE COALESCE(case when LM.dimension_wh_code in ('COMPLETED', 'RESOLVED') and RES.dimension_wh_code in ('CANCELLED') then 0 
when LM.dimension_wh_code in ('COMPLETED', 'RESOLVED') and SRC.created is not null
then timestampdiff(second, SRC.created, COALESCE(SRC.resolutiondate, compltd_dt.work_complete_on)) else 0 end, '')<> COALESCE(TRGT.duration_created_to_resolved,'');