select number,b.name,u_product_name, b.sys_id,date_format(convert_tz(a.opened_at,'GMT','US/Central'),'%Y%m%d'),d.row_id,d1.backlog_flag,lagging_count_of_month 
from ntrs_mdsdb.problem_final a
join ntrs_mdwdb.d_problem d1 on a.sys_id=d1.row_id and a.sourceinstance=d1.source_id
left join ntrs_mdsdb.cmdb_ci_model_final b on u_product_name=b.sys_id
left join ntrs_mdwdb.d_calendar_date d on date_format(convert_tz(a.opened_at,'GMT','US/Central'),'%Y%m%d')=d.row_id
where (lagging_count_of_month between 0 and 47 or d1.backlog_flag='Y') 