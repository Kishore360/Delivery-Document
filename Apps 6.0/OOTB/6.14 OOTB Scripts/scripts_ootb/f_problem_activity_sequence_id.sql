-- Data issue in 1st sequence id as created_on for d_problem is in year 2025

SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'data validation failed for f_problem_activity.sequence_id'  ELSE 'SUCCESS' END as Message
from (
select ftt.problem_key,ftt.row_id,ftt.created_on_key, ftt.created_on,ftt.row_key,task_attribute_wh_name,task_attribute_wh_new_value,task_attribute_wh_old_value,ftt.sequence_id,
(select count(*) + 1 from #DWH_TABLE_SCHEMA.f_problem_activity ftt1 where ftt1.task_wh_type = 'problem' AND ftt.problem_key = ftt1.problem_key and (ftt1.created_on < ftt.created_on or (ftt1.created_on = ftt.created_on and ftt1.task_attribute_wh_name < ftt.task_attribute_wh_name)))  as sequence_id1 
FROM #DWH_TABLE_SCHEMA.f_problem_activity ftt 
join #DWH_TABLE_SCHEMA.d_problem d on d.row_key = ftt.problem_key
WHERE ftt.task_wh_type = 'problem' and ftt.problem_key != -1 and d.soft_deleted_flag = 'N'
ORDER BY ftt.problem_key,ftt.sequence_id,task_attribute_wh_name
) A
WHERE A.sequence_id <> A.sequence_id1 OR A.sequence_id IS NULL;