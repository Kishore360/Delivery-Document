
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt FROM svb_mdsdb.cmdb_rel_ci_final relci
	LEFT JOIN svb_mdsdb.cmdb_rel_type_final reltype
	ON relci.type=reltype.sys_id 
	join svb_mdwdb.f_configuration_item_relation_c frelci on relci.sys_id=frelci.row_id and relci.sourceinstance=source_id
	where CONVERT_TZ (relci.sys_created_on,'GMT','America/Los_Angeles')<> frelci.PIVOT)abc
	
	