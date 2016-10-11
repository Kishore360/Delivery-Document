SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt  from
svb_mdsdb.incident_final a join
 svb_workdb.d_incident b
on a.sys_id=b.row_id
and a.sourceinstance=b.source_id
where a.escalation<>b.escalation_c)b