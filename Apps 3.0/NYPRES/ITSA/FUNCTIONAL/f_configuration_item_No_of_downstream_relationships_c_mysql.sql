SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from 
(select ci.sys_id as sys_id,count(rel.child)cnt 
from nypres_mdsdb.cmdb_rel_ci_final rel 
join nypres_mdsdb.cmdb_ci_final ci on rel.parent=ci.sys_id
group by 1)src
join 
(select row_id,No_of_downstream_relationships_c  from nypres_mdwdb.f_configuration_item_c) trgt
on src.sys_id=trgt.row_id 
where src.cnt <>trgt.No_of_downstream_relationships_c




