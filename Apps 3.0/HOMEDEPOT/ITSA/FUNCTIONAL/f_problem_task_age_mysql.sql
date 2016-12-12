SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(
select count(1) as cnt from homedepot_mdwdb.f_problem_task f join 
(select max(etl_run_number) as etl_run_number from homedepot_mdwdb.f_problem_task) max on f.etl_run_number = max.etl_run_number
join homedepot_mdwdb.d_o_data_freshness df on max.etl_run_number = df.etl_run_number and sourcename = 'ServiceNow_Tenant'
join homedepot_mdwdb.d_problem_task d
on f.problem_task_key = d.row_key
join homedepot_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
and br.dimension_wh_code='OPEN'
where f.age_c<>timestampdiff(hour,d.opened_on,df.lastupdated)
and
f.age_c-1<>timestampdiff(hour,d.opened_on,df.lastupdated)
)tmp
 