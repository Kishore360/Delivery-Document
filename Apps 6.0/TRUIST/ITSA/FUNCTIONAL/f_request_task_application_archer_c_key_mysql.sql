select case when count(1)>0 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>0 then 'Data mismatch for f_application_infra_c.os_end_of_support_health_code'  ELSE 'SUCCESS'  END as Message
from truist_mdwdb.f_request_task f_change_request   
INNER JOIN
truist_mdwdb.d_application_cmdb_spkg_c d_application_cmdb_spkg_c 
ON f_change_request.application_cmdb_spkg_c_key=d_application_cmdb_spkg_c.row_key  
where
f_change_request.application_archer_c_key <> d_application_cmdb_spkg_c.application_archer_c_key 