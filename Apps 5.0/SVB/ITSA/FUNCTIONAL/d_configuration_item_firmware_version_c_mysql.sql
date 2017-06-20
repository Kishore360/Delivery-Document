SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from svb_mdwdb.d_configuration_item a
JOIN svb_mdsdb.cmdb_ci_netgear_final b 
ON a.row_id=b.sys_id AND a.source_id=b.sourceinstance 
where b.firmware_version<> a.firmware_version_c;


