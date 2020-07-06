


  SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count 
-- select  distinct  a1.sys_id,d.row_id,a1.sys_id,f.row_id
from  ibmwatson_mdsdb.u_github_issues_final  a1 
left join ibmwatson_mdwdb.d_github_issues_c d on a1.sys_id=d.row_id and a1.sourceinstance=d.source_id and a1.cdctype<>'D'
join ibmwatson_mdwdb.f_github_issues_c f on a1.sys_id=f.row_id and f.source_id=2
where f.github_issues_c_key<>d.row_key)a;


