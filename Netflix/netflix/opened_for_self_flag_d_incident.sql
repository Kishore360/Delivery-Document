SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from netflix_mdwdb.d_incident a join (select sys_id, u_requester, opened_by from netflix_mdsdb.incident_final where u_requester is not null and opened_by is not null) b on a.row_id = b.sys_id and a.opened_for_self_flag= case when b.u_requester<> b.opened_by then 'Y' else 'N' end) c
