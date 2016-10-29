SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
pgi_mdwdb.f_incident finc 
join
pgi_mdsdb.incident_final inc
ON finc.row_id = inc.sys_id and finc.source_id=inc.sourceinstance
JOIN pgi_mdwdb.d_lov lkp 
ON COALESCE(CONCAT('TICKET_INTIATED_FROM~INCIDENT~~~',inc.u_ticket_initiated_from),'UNSPECIFIED')  = lkp.row_id
where coalesce(lkp.row_key,case when inc.u_ticket_initiated_from is null then 0 else -1 end)<> finc.ticket_initiated_from_c_key)a

