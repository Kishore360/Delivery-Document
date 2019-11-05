SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
from(
select count(1) cnt  from
rogers_mdwdb.d_configuration_item config 
JOIN rogers_mdsdb.cmdb_ci_final ci
on ci.sys_id  = config.row_id and ci.sourceinstance  = config.source_id
join rogers_mdsdb.cmdb_ci_appl_final app on ci.sys_id=app.sys_id
 join rogers_mdwdb.d_internal_contact d 
on case when ci.subcategory ='Business Application' then COALESCE(CONCAT('INTERNAL_CONTACT~',app.u_support_manager),'UNSPECIFIED') else
COALESCE(CONCAT('INTERNAL_CONTACT~',ci.managed_by),'UNSPECIFIED') end=d.row_id
where config.soft_deleted_flag='N' and managed_by_c_key <>
coalesce(d.row_key,case when (case when ci.subcategory='Business Application' then app.u_support_manager
else ci.managed_by end) is null then 0 else -1 end) 
and ci.cdctype='X' and d.soft_deleted_flag='N'
)a