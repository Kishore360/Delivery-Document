SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
-- select concat('INTERNAL_CONTACT~',src.u_director) erowid,lkp.row_id,coalesce(lkp.row_key,case when src.u_director is null then 0 else -1 end ) erow_key,trgt.application_director_c_key
from nypres_mdsdb.cmdb_ci_appl_final src
left join nypres_mdwdb.d_internal_contact lkp 
on concat('INTERNAL_CONTACT~',src.u_director)=lkp.row_id and  src.sourceinstance=lkp.source_id 
join nypres_mdwdb.f_configuration_item_c trgt on src.sys_id=trgt.row_id and  src.sourceinstance=trgt.source_id 
where coalesce(lkp.row_key,case when src.u_director is null then 0 else -1 end )<>trgt.application_director_c_key
and trgt.soft_deleted_flag='N' and lkp.soft_deleted_flag='N';


