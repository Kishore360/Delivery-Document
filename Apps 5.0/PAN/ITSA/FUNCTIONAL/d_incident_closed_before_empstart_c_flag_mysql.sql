SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from pan_mdsdb.incident_final a
left join pan_mdwdb.d_incident b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
where case when coalesce(a.u_closedbeforeempstart,0)='0'then 'N' else 'Y' end<>b.closed_before_empstart_c_flag)g

