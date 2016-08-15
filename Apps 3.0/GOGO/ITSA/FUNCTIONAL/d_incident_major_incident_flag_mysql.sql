SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
FROM gogo_mdsdb.incident_final a
join gogo_mdwdb.d_incident b
on a.sourceinstance=b.source_id 
and b.row_id=a.sys_id
where case when a.u_major_incident=1 then 'Y' else 'N' end<>b.major_incident_flag) z;