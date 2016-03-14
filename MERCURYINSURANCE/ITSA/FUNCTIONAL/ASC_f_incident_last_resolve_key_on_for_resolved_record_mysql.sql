
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt
 from mercuryinsurance_mdsdb.u_asc_ticket_final a 
left join  mercuryinsurance_mdwdb.f_incident b
on (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
left join  mercuryinsurance_mdwdb.d_calendar_date c
on 
DATE_FORMAT(CONVERT_TZ(a.u_resolved,'GMT','America/Los_Angeles'),'%Y%m%d') = c.row_id
where 
c.row_key <>  b.last_resolved_on_key
AND a.state IN (6,7))b