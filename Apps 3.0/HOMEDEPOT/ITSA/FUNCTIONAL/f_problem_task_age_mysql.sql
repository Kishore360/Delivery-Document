 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
SELECT count(1) as cnt
FROM
(SELECT MAX(lastupdated) AS lastupdated 
FROM homedepot_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%') as a1
join homedepot_mdwdb.d_problem_task a
join homedepot_mdwdb.f_problem_task b
on b.problem_task_key = a.row_key
join homedepot_mdwdb.d_lov_map br ON b.state_src_key = br.src_key
and br.dimension_wh_code='OPEN'
where b.age_c<>timestampdiff(hour,a.opened_on,(SELECT MAX(lastupdated) AS lastupdated
FROM homedepot_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))
and
b.age_c+1<>timestampdiff(hour,a.opened_on,(SELECT MAX(lastupdated) AS lastupdated
FROM homedepot_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')))temp;   