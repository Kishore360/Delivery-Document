

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.risk_src_code' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from bbandt_mdsdb.change_request_final SRC 
  JOIN bbandt_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.risk_value,'')<> COALESCE(TRGT.risk_value_c ,'')
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma

 
 
 
 



 
 
 
 
 