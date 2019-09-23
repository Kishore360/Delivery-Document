SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from
mercury_mdsdb.u_asc_ticket_final a join
 mercury_mdwdb.d_incident_asc_c b
on a.sys_id=b.row_id
and a.sourceinstance=b.source_id
where 

case when a.u_fcr=0 then 'N'
ELSE 'Y' END    <> b.first_call_resolution_flag)b