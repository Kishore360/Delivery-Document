SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
-- select src.u_number,src.sys_id,concat('INTERNAL_CONTACT~',src.u_vp),lkp.row_id,coalesce(lkp.row_key,case when src.u_vp is null then 0 else -1 end ),trgt.application_vp_c_key 
from nypres_mdsdb.cmdb_ci_appl_final src
left join nypres_mdwdb.d_internal_contact lkp 
on coalesce(concat('INTERNAL_CONTACT~',src.u_vp),'UNSPECIFIED')=lkp.row_id and  src.sourceinstance=lkp.source_id 
join nypres_mdwdb.f_configuration_item_c trgt on src.sys_id=trgt.row_id and  src.sourceinstance=trgt.source_id 
where coalesce(lkp.row_key,case when src.u_vp is null then 0 else -1 end )<>trgt.application_vp_c_key
and trgt.soft_deleted_flag='N' and lkp.soft_deleted_flag='N';



