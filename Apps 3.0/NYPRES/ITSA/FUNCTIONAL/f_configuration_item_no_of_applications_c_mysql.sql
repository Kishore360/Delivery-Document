SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from 
(select child.sys_id as sys_id,count(rel.parent)cnt 
from nypres_mdsdb.cmdb_rel_ci_final rel 
join nypres_mdsdb.cmdb_rel_type_final typ on rel.type=typ.sys_id
join nypres_mdsdb.cmdb_ci_final child on rel.child=ci.sys_id
join nypres_mdsdb.cmdb_ci_appl_final parent on rel.parent=parent.sys_id
where typ.name = 'Uses::Used by'
group by 1)src
join 
(select row_id,no_of_applications_c  from nypres_mdwdb.f_configuration_item_c) trgt
on src.sys_id=trgt.row_id 
where src.cnt <>trgt.no_of_applications_c







