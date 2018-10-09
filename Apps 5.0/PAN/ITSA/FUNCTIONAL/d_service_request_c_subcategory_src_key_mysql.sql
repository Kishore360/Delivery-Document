SELECT 

CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_service_request_c.subcategory_src_key' ELSE 'SUCCESS' END as Message
 FROM 
 
(select count(1) as cnt 
from 
(select sys_id, sourceinstance,u_subcategory from  pan_mdsdb.u_service_request_final where cdctype<>'D') SRC
 
LEFT JOIN (select row_key, source_id,row_id from pan_mdwdb.d_lov where soft_deleted_flag<>'Y') LKP 
 
ON ( concat('SUBCATEGORY_C~SERVICE_REQUEST_C~',upper(u_subcategory))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
 
LEFT JOIN pan_mdwdb.d_service_request_c TRGT 
 
ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_subcategory IS NULL THEN 0 else -1 end)<> (TRGT.subcategory_src_key)) temp;