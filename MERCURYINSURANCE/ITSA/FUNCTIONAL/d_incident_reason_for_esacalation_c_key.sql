SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from
mercuryinsurance_mdsdb.incident_final a join
 mercuryinsurance_mdwdb.d_incident b
on a.sys_id=b.row_id
and a.sourceinstance=b.source_id
where 
a.u_reason_for_escalation<>b.reason_for_escalation_c