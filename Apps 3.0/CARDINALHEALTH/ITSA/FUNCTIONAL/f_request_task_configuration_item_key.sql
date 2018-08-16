SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from (SELECT *,COALESCE(cmdb_ci,'UNSPECIFIED') as jn1  FROM cardinalhealth_mdsdb.sc_task_final ) a
JOIN  cardinalhealth_mdwdb.f_request_task b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id

join cardinalhealth_mdwdb.d_configuration_item lkp
on jn1 = lkp.row_id 
where coalesce(lkp.row_key,case when a.cmdb_ci is null then 0 else -1 end)<> b.configuration_item_key
)c
;