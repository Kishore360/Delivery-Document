SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from 
(select ci.sys_id as CI,count(rel.sys_id)cnt 
from nypres_mdsdb.cmdb_rel_ci_final rel 
join nypres_mdsdb.cmdb_rel_type_final typ on rel.type=typ.sys_id
join nypres_mdsdb.cmdb_ci_final ci on rel.parent=ci.sys_id
join nypres_mdsdb.cmdb_ci_service_final ser on rel.child=ser.sys_id
where typ.name = 'Uses::Used by'
group by 1)src
join 
(select row_id,no_of_related_items  from nypres_mdwdb.f_configuration_item) trgt
on src.sys_id=tgrt.row_id 
where src.cnt <>trgt.no_of_related_items





