SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from nypres_mdsdb.cmdb_ci_win_server_final src
join nypres_mdwdb.d_configuration_item trgt on src.sys_id=trgt.row_id and  src.sourceinstance=trgt.source_id 
where src.u_last_boot_up_date <>trgt.last_boot_up_date_c






