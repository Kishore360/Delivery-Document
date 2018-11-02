 SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, 
 
CASE WHEN cnt > 0 THEN 'Data did not Match' ELSE 'Data Matched' END AS Message 

FROM (select count(1) cnt 
from 
(select sys_id, sourceinstance,u_support_domain from  paloalto_mdsdb.u_service_request_final where cdctype<>'D') src
 
JOIN  paloalto_mdwdb.d_service_request_c  trgt 
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
 
LEFT JOIN (select row_id, row_key, source_id from paloalto_mdwdb.d_lov where soft_deleted_flag<>'Y') lkp
 
ON COALESCE(CONCAT('SUPPORT_DOMAIN~SERVICE_REQUEST_C~',src.u_support_domain),'UNSPECIFIED') =lkp.row_id 

where COALESCE(lkp.row_key,CASE WHEN src.u_support_domain IS NULL THEN 0 else -1 end)<> trgt.support_domain_src_c_key)a; 