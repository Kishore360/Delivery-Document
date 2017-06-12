SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from nypres_mdsdb.cmdb_ci_computer_final src
join nypres_mdwdb.f_configuration_item trgt on src.sys_id=trgt.row_id and  src.source_id=trgt.sourceinstance 
where src.ram <>trgt.ram_c

