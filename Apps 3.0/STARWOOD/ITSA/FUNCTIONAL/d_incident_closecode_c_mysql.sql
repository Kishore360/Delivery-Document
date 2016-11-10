SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result

,CASE WHEN cnt > 0 THEN 'Data did not Match.' 

ELSE 'Data Matched' END AS Message 

FROM (
select count(1) as cnt  
from starwood_mdsdb.task_final a

left join starwood_mdsdb.incident_final c
on a.sys_id=c.sys_id

left join starwood_mdsdb.u_close_code_master d 
on c.u_closecode=d.sys_id and a.sourceinstance=d.sourceinstance

left JOIN  starwood_mdwdb.d_incident b
on c.sys_id=b.row_id and c.sourceinstance=b.source_id

where  b.closecode_c <> d.u_close___cause_code)b 