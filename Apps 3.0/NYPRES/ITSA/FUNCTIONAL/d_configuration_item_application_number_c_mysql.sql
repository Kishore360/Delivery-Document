SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from nypres_mdsdb.cmdb_ci_appl_final src
left join nypres_mdwdb.d_configuration_item trgt on src.sys_id=trgt.row_id and  trgt.source_id=src.sourceinstance 
where src.u_number <>trgt.application_number_c




