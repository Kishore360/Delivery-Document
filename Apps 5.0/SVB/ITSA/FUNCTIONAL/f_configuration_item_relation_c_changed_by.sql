 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from svb_mdsdb.cmdb_rel_ci_final a
	LEFT JOIN svb_mdsdb.cmdb_rel_type_final b
ON a.type=b.sys_id
 left  JOIN  svb_mdwdb.f_configuration_item_relation_c c
on  c.ROW_ID = a.SYS_ID and a.sourceinstance=c.source_id
where  a.sys_updated_by<>c.changed_by
 )c
