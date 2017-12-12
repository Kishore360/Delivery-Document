 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from svb_mdsdb.cmdb_rel_ci_final a
	LEFT JOIN svb_mdsdb.cmdb_rel_type_final b
ON a.type=b.sys_id
left join svb_mdwdb.f_configuration_item_relation_c c
on  c.row_id = a.sys_id and a.sourceinstance=c.source_id
where  CONVERT_TZ(a.sys_updated_on,'GMT','America/Los_Angeles')<>c.changed_on )c
