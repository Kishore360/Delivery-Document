SELECT 

CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_service_request_c.priority_src_key' ELSE 'SUCCESS' END as Message
 
FROM 
 
(select count(1) as cnt 
from 
 
(select sys_id, sourceinstance, priority from paloalto_mdsdb.u_service_request_final where CDCTYPE<>'D') SRC 

LEFT JOIN ( select row_id, source_id, row_key from paloalto_mdwdb.d_lov where soft_deleted_flag<>'Y') LKP 
 
ON ( concat('PRIORITY_C~SERVICE_REQUEST_C~',upper(priority))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
 
LEFT JOIN paloalto_mdwdb.d_service_request_c TRGT 
 
ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end) <> (TRGT.priority_src_key))temp;