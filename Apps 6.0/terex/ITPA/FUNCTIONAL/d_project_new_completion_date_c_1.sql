select CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_project.new_completion_date_c' ELSE 'SUCCESS' END as Message
from terex_b1_mdwdb.d_project d
join terex_b1_mdwdb.d_project_phase_history_c phase on phase.project_key = d.row_key
 WHERE phase.project_phase = '(6) Completed' and phase.current_flag = 'N'
 and d.new_completion_date_c IS NOT NULL;