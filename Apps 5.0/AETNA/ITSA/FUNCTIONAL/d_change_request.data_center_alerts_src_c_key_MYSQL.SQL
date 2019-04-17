 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.data_center_alerts_src_c_key' ELSE 'SUCCESS' END as Message  
 FROM (select count(1) as cnt  from aetna_mdsdb.change_request_final  SRC
 LEFT JOIN aetna_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN aetna_mdwdb.d_lov LKP
 ON (COALESCE(CONCAT('DATA_CENTER_ALERTS~CHANGE_REQUEST~~~',UPPER(SRC.u_data_center_alerts)),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_data_center_alerts  IS NULL THEN 0 else -1 end) <> TRGT.data_center_alerts_src_c_key
 and SRC.cdctype<>'D')ma;

 