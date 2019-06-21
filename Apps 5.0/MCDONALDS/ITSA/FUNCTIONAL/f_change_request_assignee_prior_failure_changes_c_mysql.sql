SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message
FROM  mcdonalds_mdwdb.f_change_request trgt
inner join 
(
select t1.assigned_to_key, t1.change_start_date, t1.change_request_key, count(*) as prior_close_changes,
sum(case when t2.alternative_change_failure_c_flag = 'Y' then 1 else 0 end) as prior_failure_changes,
sum(case when t2.alternative_change_failure_c_flag = 'N' then 1 else 0 end) as prior_success_changes
from 
(
select d.row_key as change_request_key,d.assigned_to_key, d.alternative_change_failure_c_flag, coalesce(d.work_start_on, d.u_planned_start_date_c) as change_start_date, coalesce(d.closed_on, d.work_end_on) as change_end_date
from mcdonalds_mdwdb.d_change_request d 
join 
(select distinct f.assigned_to_key  
from mcdonalds_mdwdb.f_change_request f) t 
on d.assigned_to_key = t.assigned_to_key
where t.assigned_to_key <> 0) t1 
join (
select d.row_key as change_request_key,d.assigned_to_key, d.alternative_change_failure_c_flag, coalesce(d.work_start_on, d.u_planned_start_date_c) as change_start_date, coalesce(d.closed_on, d.work_end_on) as change_end_date
from mcdonalds_mdwdb.d_change_request d 
join 
(select distinct f.assigned_to_key  
from mcdonalds_mdwdb.f_change_request f) t 
on d.assigned_to_key = t.assigned_to_key
where t.assigned_to_key <> 0 )t2 
on t1.assigned_to_key = t2.assigned_to_key and t1.change_start_date > t2.change_end_date
group by 1,2,3) t1
on trgt.change_request_key = t1.change_request_key 
WHERE coalesce(t1.prior_failure_changes,0) <> trgt.assignee_prior_failure_changes_c

