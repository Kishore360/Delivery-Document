SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from nypres_mdsdb.cmdb_ci_appl_final src
left join nypres_mdwdb.d_internal_contact lkp on src.u_director=right(lkp.row_id,32) and  src.source_id=lkp.sourceinstance 
join nypres_mdwdb.f_configuration_item trgt on src.sys_id=trgt.row_id and  src.source_id=trgt.sourceinstance 
where coalesce(lkp.row_key,case when src.u_director is null then 0 else -1 end )<>trgt.application_director_c_key


