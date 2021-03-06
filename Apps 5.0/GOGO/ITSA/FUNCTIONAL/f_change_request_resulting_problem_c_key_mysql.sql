SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from gogo_mdsdb.change_request_final a
inner join gogo_mdwdb.f_change_request  b on a.sys_id =b.row_id and a.sourceinstance=b.source_id 
left outer join gogo_mdwdb.d_problem c on a.u_resulting_problem=c.row_id 
 where case when  a.u_resulting_problem is null then 0
 else case when c.row_key is null then -1 else c.row_key end end <>b.resulting_problem_c_key
) c;


