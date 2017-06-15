SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from nypres_mdsdb.cmdb_ci_appl_final src
left join nypres_mdwdb.d_service lkp on src.u_business_function=right(lkp.row_id,32) and  src.sourceinstance=lkp.source_id 
join nypres_mdwdb.f_configuration_item_c trgt on src.sys_id=trgt.row_id and  src.sourceinstance=trgt.source_id 
where coalesce(lkp.row_key,case when src.u_business_function is null then 0 else -1 end )<>trgt.business_function_c_key





