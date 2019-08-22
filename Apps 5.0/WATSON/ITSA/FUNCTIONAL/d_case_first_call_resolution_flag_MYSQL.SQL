 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM  watson_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN watson_mdwdb.d_case TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  LEFT JOIN  watson_mdwdb.f_case TRGTF 
 ON (TRGTF.case_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
 JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid)
LEFT JOIN watson_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key and LM.dimension_class='STATE~CASE'
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  watson_mdwdb.d_o_data_freshness
 group by source_id
 ) FRESH 
ON (TRGT.source_id = FRESH.source_id)

 WHERE  TRGT.row_key not in (0, -1) and 
 CASE WHEN TIMESTAMPDIFF(MINUTE,coalesce(SRC.opened_at,'1970-01-01 00:00:00'), coalesce(convert_tz(TRGT.last_resolved_on,L.target_time_zone,L.source_time_zone),SRC.closed_at,SRC.sys_updated_on))<0 then 'N'
 when LM.dimension_wh_code IN('RESOLVED','CLOSED') 
 AND TIMESTAMPDIFF(MINUTE,coalesce(SRC.opened_at,'1970-01-01 00:00:00'), coalesce(convert_tz(TRGT.last_resolved_on,L.target_time_zone,L.source_time_zone),SRC.closed_at,SRC.sys_updated_on))<30
  THEN 'Y' ELSE 'N' END  <> COALESCE(TRGT.first_call_resolution_flag ,'')