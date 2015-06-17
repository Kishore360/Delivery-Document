SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from rei_mdwdb.f_time_entry fi JOIN rei_mdsdb.time_card_final  f ON (substring(fi.row_id,1,32) =f.sys_id) 
join rei_mdwdb.d_project project  on project.row_id=COALESCE(f.u_project,'UNSPECIFIED')
and fi.project_key <> project.row_key and fi.row_key < 10000) c;