select CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_project.new_completion_date_c' ELSE 'SUCCESS' END as Message
from terex_b1_mdwdb.d_project d
JOIN terex_b1_mdwdb.d_project_phase_history_c p on d.row_key = p.project_key
JOIN (SELECT phase.project_key, 
	   phase.effective_from AS effective_from, 
	   proj.dw_inserted_on AS inserted_on
FROM terex_b1_mdwdb.d_project_phase_history_c phase
JOIN terex_b1_mdwdb.d_project proj ON phase.project_key = proj.row_key
WHERE phase.project_phase = '(6) Completed' and phase.current_flag = 'Y'
GROUP BY phase.project_key) t ON d.row_key = t.project_key
WHERE d.row_key = t.project_key AND p.project_phase = '(6) Completed' AND p.current_flag = 'Y'
AND d.new_completion_date_c <> CASE WHEN t.effective_from = '1970-01-01 00:00:00' THEN t.inserted_on ELSE t.effective_from END;		