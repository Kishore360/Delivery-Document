SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
(SELECT c.sys_id AS sys_id,
		   a.sourceinstance AS sourceinstance,
		   		   MAX(u_offering_type) AS offering_type_c from 		   
    intuit_mdsdb.u_cmdb_ci_offering_final a
	LEFT JOIN intuit_mdsdb.cmdb_rel_ci_final b ON (a.sys_id=b.parent)
	LEFT JOIN intuit_mdsdb.cmdb_ci_final c ON (b.child=c.sys_id)
	GROUP BY 1,2)t 
left join intuit_mdwdb.d_configuration_item d
on t.sys_id=d.row_id and t.sourceinstance = d.source_id
where t.offering_type_c <> d.offering_type_c) temp
