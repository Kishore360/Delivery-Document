SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from 
svb_mdsdb.cmdb_ci_final src
join  svb_mdsdb.cmdb_ci_storage_server_final  lkp on src.sys_id=lkp.sys_id
join  svb_mdwdb.d_configuration_item trgt on  src.sys_id=trgt.row_id
where lkp.firmware_version<>software_version_c;