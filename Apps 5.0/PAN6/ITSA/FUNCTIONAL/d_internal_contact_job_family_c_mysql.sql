SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from (
select count(1) cnt FROM  pan_mdsdb.sys_user_final
left join  pan_mdwdb.d_internal_contact d1 on concat('INTERNAL_CONTACT~',sys_id)=d1.row_id and sourceinstance=d1.source_id
where job_family_c<>u_job_family)a;


