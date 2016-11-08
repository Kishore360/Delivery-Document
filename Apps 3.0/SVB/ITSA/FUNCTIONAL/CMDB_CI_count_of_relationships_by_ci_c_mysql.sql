SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM 
(
select sum(count_of_parent_relationships) src, count_of_relationships_by_ci_c trgt from 
(select bb.sys_id sys_id,bb.sourceinstance sourceinstance,count(aa.type) count_of_parent_relationships , 'parent' rel_type_flag
from svb_mdsdb.cmdb_rel_ci_final aa
join svb_mdsdb.cmdb_ci_final bb on aa.parent=bb.sys_id and aa.sourceinstance = bb.sourceinstance
group by bb.sys_id,bb.sourceinstance
union all
select bbc.sys_id sys_id,bbc.sourceinstance sourceinstance,count(aac.type) count_of_parent_relationships , 'child' rel_type_flag
from svb_mdsdb.cmdb_rel_ci_final aac
join svb_mdsdb.cmdb_ci_final bbc on aac.child=bbc.sys_id and aac.sourceinstance = bbc.sourceinstance
group by bbc.sys_id,bbc.sourceinstance)b
left join  svb_mdwdb.d_configuration_item c on b.sys_id=c.row_id and b.sourceinstance=c.source_id 
group by b.sys_id,b.sourceinstance 
)abc
where src<>trgt

