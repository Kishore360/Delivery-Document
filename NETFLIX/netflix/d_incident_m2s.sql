SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN concat('Data did not Match: ',cnt) 
ELSE 'Data Matched' END AS Message 
FROM (
select a.cnt1-b.cnt2 as cnt from (
select count(*) as cnt1 from netflix_mdwdb.d_incident where row_id not in(0,-1)) a,
(select count(*) as cnt2 FROM netflix_mdsdb.incident_final i
LEFT JOIN netflix_mdsdb.incident_final parent_i
ON i.u_parent_incident=parent_i.sys_id)b)c;
 
 