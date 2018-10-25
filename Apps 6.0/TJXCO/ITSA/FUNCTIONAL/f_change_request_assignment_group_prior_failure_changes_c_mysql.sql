SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message
FROM  tjxco_mdwdb.f_change_request trgt
inner join 
(
select t1.assignment_group_key, t1.change_start_date, t1.change_request_key, count(*) as prior_close_changes,
sum(case when t2.failure_flag = 'Y' then 1 else 0 end) as prior_failure_changes,
sum(case when t2.failure_flag = 'N' then 1 else 0 end) as prior_success_changes
from 
(
select d.row_key as change_request_key,d.assignment_group_key, d.failure_flag, coalesce(d.work_start_on, d.planned_start_on,d.opened_on) as change_start_date, d.closed_on as change_end_date
from tjxco_mdwdb.d_change_request d 
join 
(select distinct f.assignment_group_key  
from tjxco_mdwdb.f_change_request f) t 
on d.assignment_group_key = t.assignment_group_key
where t.assignment_group_key <> 0) t1 
join (
select d.row_key as change_request_key,d.assignment_group_key, d.failure_flag, coalesce(d.work_start_on, d.planned_start_on,d.opened_on) as change_start_date, d.closed_on as change_end_date
from tjxco_mdwdb.d_change_request d 
join 
(select distinct f.assignment_group_key  
from tjxco_mdwdb.f_change_request f) t 
on d.assignment_group_key = t.assignment_group_key
where t.assignment_group_key <> 0 )t2 
on t1.assignment_group_key = t2.assignment_group_key and t1.change_start_date > t2.change_end_date
group by 1,2,3) t1
on trgt.change_request_key = t1.change_request_key 
WHERE coalesce(t1.prior_failure_changes,0) <> trgt.assignment_group_prior_failure_changes_c