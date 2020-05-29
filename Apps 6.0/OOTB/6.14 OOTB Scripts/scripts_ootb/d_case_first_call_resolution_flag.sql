 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_customerservice_case_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_case TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.f_case TRGTF 
ON (TRGTF.case_key =TRGT.row_key
AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM ON TRGTF.state_src_key=LM.src_key and LM.dimension_class='STATE~CASE'
LEFT JOIN (
select source_id,max(lastupdated) as lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness
group by source_id
) FRESH 
ON (TRGT.source_id = FRESH.source_id)

WHERE 
(
CASE when LM.dimension_wh_code IN('RESOLVED','CLOSED') 
AND TIMESTAMPDIFF(MINUTE,coalesce(SRC.opened_at,'1970-01-01 00:00:00'), 
coalesce(convert_tz(TRGT.last_resolved_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),SRC.closed_at,SRC.sys_updated_on))<=30 THEN 'Y'
when LM.dimension_wh_code IN('RESOLVED','CLOSED') 
AND TIMESTAMPDIFF(MINUTE,coalesce(SRC.opened_at,'1970-01-01 00:00:00'), 
coalesce(convert_tz(TRGT.last_resolved_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),SRC.closed_at,SRC.sys_updated_on))>30 THEN 'N'
WHEN LM.dimension_wh_code IN('OPEN') AND 
TIMESTAMPDIFF(MINUTE,coalesce(SRC.opened_at,'1970-01-01 00:00:00'), convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))<30 then 'P'
WHEN LM.dimension_wh_code IN('OPEN') AND
TIMESTAMPDIFF(MINUTE,coalesce(SRC.opened_at,'1970-01-01 00:00:00'), convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))>=30 then 'N'
ELSE 'N' END) <> COALESCE(TRGT.first_call_resolution_flag ,'')
