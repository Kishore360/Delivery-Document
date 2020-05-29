SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_problem.sunrise_duration_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as CNT from wpl_mdwdb.f_problem a11
left join wpl_mdsdb.problem_final der
 on  a11.row_id=der.sys_id and a11.source_id=der.sourceinstance
left join (select row_id,source_id,problem_number,preliminar_rca_completed_c,final_rca_completed_c,sum(actual_duration) as actual_sunrise_duration_c,max(sunrise_duration_c)
from
(
select a.row_id,a.source_id,a.problem_number,b.calendar_date,b.day_of_week,b.day_name,timestamp(b.calendar_date) day_start,
DATE_ADD(b.calendar_date, INTERVAL 86400 second) as day_end_on,
preliminar_rca_completed_c,date(preliminar_rca_completed_c),
final_rca_completed_c ,date(final_rca_completed_c),
timestampdiff(second,preliminar_rca_completed_c,final_rca_completed_c) as sunrise_duration_c,
case when date(preliminar_rca_completed_c) = date(final_rca_completed_c) then
TIMESTAMPDIFF(SECOND,preliminar_rca_completed_c,final_rca_completed_c)
when date(preliminar_rca_completed_c) = date(timestamp(b.calendar_date)) then
TIMESTAMPDIFF(SECOND,preliminar_rca_completed_c,DATE_ADD(b.calendar_date, INTERVAL 86400 second))
when date(final_rca_completed_c) = date (timestamp(b.calendar_date)) then
TIMESTAMPDIFF(SECOND,timestamp(b.calendar_date),final_rca_completed_c)else 86400
end as actual_duration
from wpl_mdwdb.d_problem a 
join wpl_mdwdb.d_calendar_date b
on b.calendar_date between date(preliminar_rca_completed_c) and date(final_rca_completed_c)
and b.day_of_week not in (6,7)

union 

select a.row_id,a.source_id,a.problem_number,b.calendar_date,b.day_of_week,b.day_name,timestamp(b.calendar_date) day_start,
DATE_ADD(b.calendar_date, INTERVAL 86400 second) as day_end_on,
preliminar_rca_completed_c,date(preliminar_rca_completed_c),
final_rca_completed_c ,date(final_rca_completed_c),
timestampdiff(second,preliminar_rca_completed_c,final_rca_completed_c) as sunrise_duration_c,

(case when date(preliminar_rca_completed_c) = date(final_rca_completed_c) then
TIMESTAMPDIFF(SECOND,final_rca_completed_c,preliminar_rca_completed_c)
when date(final_rca_completed_c) = date(timestamp(b.calendar_date)) then
TIMESTAMPDIFF(SECOND,final_rca_completed_c,DATE_ADD(b.calendar_date, INTERVAL 86400 second))
when date(preliminar_rca_completed_c) = date (timestamp(b.calendar_date)) then
TIMESTAMPDIFF(SECOND,timestamp(b.calendar_date),preliminar_rca_completed_c)else 86400
end)*-1 as actual_duration
from wpl_mdwdb.d_problem a 
join wpl_mdwdb.d_calendar_date b
on b.calendar_date between date(final_rca_completed_c) and date(preliminar_rca_completed_c)
 and b.day_of_week not in (6,7))
main
group by 1,2,3,4,5)problem_state_temp
on a11.row_id=problem_state_temp.row_id and a11.source_id=problem_state_temp.source_id 
 where  (a11.sunrise_duration_c<>problem_state_temp.actual_sunrise_duration_c and der.cdctype<>'D'))der;

