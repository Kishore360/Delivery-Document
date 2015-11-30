SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result

,CASE WHEN cnt > 0 THEN 'Data did not Match.' 

ELSE 'Data Matched' END AS Message 

FROM (

select count(1) as cnt  

from starwood_mdsdb.task_final a

inner join starwood_mdsdb.incident_final c 
on a.sys_id=c.sys_id

inner  JOIN  starwood_mdsdb.request_category_final b 
on c.u_request_category=b.sys_id
left join starwood_mdwdb.d_incident d 
on a.SYS_ID= d.ROW_ID and a.sourceinstance=d.source_id

where  b.u_name<> d.request_category_c)b 