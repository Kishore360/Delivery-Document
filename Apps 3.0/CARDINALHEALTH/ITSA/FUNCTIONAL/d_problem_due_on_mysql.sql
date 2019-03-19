SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt  from
cardinalhealth_mdsdb.problem_final a join
  cardinalhealth_mdwdb.d_problem b
on a.sys_id=b.row_id
and a.sourceinstance=b.source_id
where convert_tz(a.due_date,'GMT','America/New_York') <>b.due_on)b




