 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from
svb_mdwdb.d_configuration_item dci inner join 
 (select aa.sys_id,sum(count_of_parent_relationships) vcount from svb_mdsdb.cmdb_ci_delta incf
left join(select bbc.sys_id sys_id,bbc.sourceinstance sourceinstance,count(aac.type) count_of_parent_relationships , 'child' rel_type_flag
from svb_mdsdb.cmdb_rel_ci_final aac
join svb_mdsdb.cmdb_ci_final bbc
on aac.child=bbc.sys_id and aac.sourceinstance = bbc.sourceinstance
group by bbc.sys_id,bbc.sourceinstance
union
select bb.sys_id sys_id,bb.sourceinstance sourceinstance,count(aa.type) count_of_parent_relationships , 'parent' rel_type_flag
from svb_mdsdb.cmdb_rel_ci_final aa
join svb_mdsdb.cmdb_ci_final bb
on aa.parent=bb.sys_id and aa.sourceinstance = bb.sourceinstance
group by bb.sys_id,bb.sourceinstance)aa
on incf.sourceinstance= aa.sourceinstance and incf.sys_id=aa.sys_id group by sys_id ) cc
on cc.sys_id=dci.row_id
where count_of_relationships_by_ci_c<>coalesce(cc.vcount,0))a
