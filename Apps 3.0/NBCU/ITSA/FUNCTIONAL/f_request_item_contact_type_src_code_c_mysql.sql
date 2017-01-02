SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM nbcu_mdsdb.sc_req_item_final SRC 
  JOIN nbcu_mdwdb.d_lov LKP 
  ON COALESCE( CONCAT('CONTACT_TYPE_C','~','REQUEST_ITEM','~','~','~',upper(SRC.contact_type)),'UNSPECIFIED') =LKP.row_id  AND SRC.sourceinstance= LKP.source_id 
  JOIN nbcu_mdwdb.f_request_item TRGT 
  ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
  where TRGT.contact_type_src_code_c <>coalesce(LKP.row_key,case WHEN SRC.contact_type is null then 0 else -1 end)
  AND DATE_FORMAT(TRGT.pivot_date, '%Y-%m-%d %H:%i:%s') BETWEEN effective_from AND effective_to
  
  
  
  