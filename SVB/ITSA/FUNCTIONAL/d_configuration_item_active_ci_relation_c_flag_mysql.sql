SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message FROM (

select count(1) as cnt from (
select case when cnt1>0 then'Y' else 'N' end as SRC,active_ci_relation_c_flag TRGT
from 
(
	select active_ci_relation_c_flag,sum(count_of_parent_relationships) cnt1 from 
	(
			select bb.sys_id sys_id,bb.sourceinstance sourceinstance,count(aa.type) count_of_parent_relationships , 'parent' rel_type_flag
			from svb_mdsdb.cmdb_rel_ci_final aa
			join svb_mdsdb.cmdb_ci_final bb
			on aa.parent=bb.sys_id and aa.sourceinstance = bb.sourceinstance
			group by bb.sys_id,bb.sourceinstance
			union 
			select bbc.sys_id sys_id,bbc.sourceinstance sourceinstance,count(aac.type) count_of_parent_relationships , 'child' rel_type_flag
			from svb_mdsdb.cmdb_rel_ci_final aac
			join svb_mdsdb.cmdb_ci_final bbc
			on aac.child=bbc.sys_id and aac.sourceinstance = bbc.sourceinstance
			group by bbc.sys_id,bbc.sourceinstance
	)a

join svb_mdwdb.d_configuration_item c on a.sys_id=c.row_id and a.sourceinstance=c.source_id
)abc
 where case when cnt1>0 then'Y' else 'N' end <>active_ci_relation_c_flag)def)ghi
 
 