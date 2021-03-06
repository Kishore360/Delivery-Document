
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt  from
mercuryins_mdsdb.incident_final a join
 mercuryins_mdwdb.d_incident b
on a.sys_id=b.row_id
and a.sourceinstance=b.source_id
where 
case when a.u_escalated_to_supervisor = 1 then 'Y' else 'N' end <> b.escalated_to_supervisor_c)b