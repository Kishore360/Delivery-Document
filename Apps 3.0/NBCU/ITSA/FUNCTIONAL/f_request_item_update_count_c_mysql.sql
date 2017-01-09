  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM nbcu_mdsdb.sc_req_item_final SRC 
   JOIN nbcu_mdwdb.f_request_item TRGT 
  ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
  where   TRGT.update_count_c<>
  SRC.sys_mod_count