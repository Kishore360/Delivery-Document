SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0  
THEN 'MDS to DWH data validation failed for d_problem.problem_investigation_start_c' ELSE 'SUCCESS' END as Message FROM (
select count(1)cnt  from
(select number,b.name,u_product_name, b.sys_id,date_format(convert_tz(a.opened_at,'GMT','US/Central'),'%Y%m%d'),
d.row_id,d1.backlog_flag,lagging_count_of_month ,
coalesce(b1.row_key,case when u_product_name is null then 0 else -1 end),b11.problem_product_name_c_key
from ntrs_mdsdb.problem_final a
join ntrs_mdwdb.d_problem d1 on a.sys_id=d1.row_id and a.sourceinstance=d1.source_id
left join ntrs_mdsdb.cmdb_ci_model_final b on u_product_name=b.sys_id and a.sourceinstance=b.sourceinstance
left join ntrs_mdwdb.d_cmdb_ci_model_c b1 on b1.row_id=b.sys_id and a.sourceinstance=b1.source_id
left join ntrs_mdwdb.f_problem b11 on b11.row_id=a.sys_id and a.sourceinstance=b11.source_id
left join ntrs_mdwdb.d_calendar_date d on date_format(convert_tz(a.opened_at,'GMT','US/Central'),'%Y%m%d')=d.row_id
where  coalesce(b1.row_key,case when u_product_name is null then 0 else -1 end)<>b11.problem_product_name_c_key )a)v;


