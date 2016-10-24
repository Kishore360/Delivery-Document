
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,

CASE WHEN cnt > 0 THEN 'Data did not Match.'ELSE 'Data Matched' END AS Message 

from(select  count(1) as cnt
 from rambus_mdwdb.f_problem a
 INNER JOIN rambus_mdsdb.problem_final b 
ON a.row_id=b.sys_id
 AND a.source_id=b.sourceinstance
 LEFT OUTER JOIN rambus_mdwdb.d_calendar_date c 
ON c.row_id=DATE_FORMAT(CONVERT_TZ(b.u_workaround_date,'GMT','America/Los_Angeles'),'%Y%m%d')
where  a.workaround_on_c_key<> CASE WHEN b.u_workaround_date is null THEN 0 ELSE (c.row_key )END) z;