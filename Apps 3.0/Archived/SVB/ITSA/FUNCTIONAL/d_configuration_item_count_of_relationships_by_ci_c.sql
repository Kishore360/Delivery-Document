 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
(select 
cc.sys_id,cc.vcount as count_of_parent_relationships
from 
(select aa.sys_id,sum(count_of_parent_relationships) vcount from svb_mdsdb.cmdb_ci_final incf
left join (select bbc.sys_id sys_id,bbc.sourceinstance sourceinstance,count(aac.type) count_of_parent_relationships , 'child' rel_type_flag
from svb_mdsdb.cmdb_rel_ci_final aac
join svb_mdsdb.cmdb_ci_final bbc
on aac.child=bbc.sys_id and aac.sourceinstance = bbc.sourceinstance
group by bbc.sys_id,bbc.sourceinstance)  aa
on incf.sourceinstance= aa.sourceinstance and incf.sys_id=aa.sys_id group by sys_id ) cc) src
join 
svb_mdwdb.d_configuration_item c
on src.sys_id=c.row_id
where  src.count_of_parent_relationships<>c.count_of_relationships_by_ci_c

 )c
