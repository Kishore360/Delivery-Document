SELECT
(priority_factor_c)* (case when lov.dimension_name='Yes' then 1
when dimension_name='Yes, Undocumented' then 1.25 else 0 end) *
(case when elapsed_time_c>=0 and elapsed_time_c<=30 then 10
when elapsed_time_c>30 and elapsed_time_c<=60 then 7
when elapsed_time_c>60 and elapsed_time_c<=90 then 5
when elapsed_time_c>90 and elapsed_time_c<=120 then 3 else 0 end) as pbi_deduction,f.sys_id,f.number
FROM (select sys_id,number,sourceinstance,state,u_related_to_change,
timestampdiff(second,convert_tz(f.opened_at,'GMT','America/Los_Angeles'),df.lastupdated)/86400 as elapsed_time_c,
timestampdiff(day,convert_tz(f.opened_at,'GMT','America/Los_Angeles'),df.lastupdated) as curr_to_open_dur_c,
case when f.priority='1' then 20 when priority=2 then 10 when priority in (3,4) then 5 else 0 end as priority_factor_c
from ingrammicro_mdsdb.problem_final f
JOIN (select max(lastupdated) as lastupdated,source_id from ingrammicro_mdwdb.d_o_data_freshness group by source_id) df on
f.sourceinstance=df.source_id) f
LEFT JOIN ingrammicro_mdwdb.d_lov lov on lov.dimension_class='RELATED_TO_CHANGE_C~PROBLEM' and f.u_related_to_change=lov.dimension_code
LEFT JOIN ingrammicro_mdwdb.d_lov_map st on st.dimension_class='STATE~PROBLEM' and f.state=st.dimension_code
WHERE curr_to_open_dur_c<=120 and lov.dimension_name IN ('Yes, Undocumented','Yes')
and st.dimension_wh_code <>'CANCELLED';

SELECT
d.problem_number,priority_factor_c* undocumented_factor_c * elapsed_time_factor_c as pbi_deduction,f.pbi_deduction_c
FROM ldb.f_problem f
JOIN ldb.d_problem d on f.problem_key=d.row_key
LEFT JOIN ldb.d_related_to_change_c lov on d.u_related_to_change_c_key=lov.row_key
LEFT JOIN ldb.d_problem_state st on f.state_src_key=st.row_key
WHERE f.current_to_opened_duration_c <=120 and lov.source_dimension_name IN ('Yes, Undocumented','Yes')
and st.wh_dimension_code <>'CANCELLED';