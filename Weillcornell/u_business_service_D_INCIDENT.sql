SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select (A.src_count - B.tar_count) as cnt from 
(select count(1) as src_count from weillcornell_mdwdb.d_incident where soft_deleted_flag <>'Y')A,
(select count(1)+2 as tar_count from weillcornell_mdsdb.incident_final where (sys_id,number) not in (
select a.sys_id,number from weillcornell_mdsdb.incident_final a left outer join weillcornell_mdsdb.sys_user_final b
on b.sys_id=a.caller_id 
left outer join weillcornell_mdsdb.cmdb_ci_final c on c.sys_id = a.u_business_service
where (b.name ='Affected Guest' AND c.name='Online Directory')) )B) c