SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
(
select d.change_control_c_key,
COALESCE((CASE WHEN COALESCE(CONCAT('GROUP~',i.change_control),'UNSPECIFIED') = 'UNSPECIFIED'
						THEN 0
						ELSE (
 (j.row_key) 	)	END	), -1) AS change_control_key 
FROM intuit_mdsdb.cmdb_ci_appl_final i 
left join intuit_mdwdb.d_internal_organization  j
on j.row_id =COALESCE(CONCAT('GROUP~',i.change_control),'UNSPECIFIED') AND i.sourceinstance=j.source_id
left join intuit_mdwdb.d_configuration_item d on i.sys_id=d.row_id AND i.sourceinstance=d.source_id
)a
where a.change_control_c_key<>COALESCE(a.change_control_key,0)
)temp