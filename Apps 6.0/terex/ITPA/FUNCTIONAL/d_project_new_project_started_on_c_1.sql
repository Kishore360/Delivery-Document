select CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_project.new_project_started_on_c' ELSE 'SUCCESS' END as Message
from terex_b1_mdwdb.d_project d
JOIN (SELECT phase.project_key, 
	   min(phase.effective_from) AS min_effective_from, 
	   min(proj.dw_inserted_on) AS min_inserted_on
FROM terex_b1_mdwdb.d_project_phase_history_c phase
JOIN terex_b1_mdwdb.d_project proj ON phase.project_key = proj.row_key
WHERE phase.project_phase IN ('(1) Proposal','(2) Feasibility','(3) Development','(4) Validation','(5) Cutover & Launch')
GROUP BY phase.project_key) t ON d.row_key = t.project_key
WHERE d.row_key = t.project_key
and d.new_project_started_on_c <> CASE WHEN t.min_effective_from = '1970-01-01 00:00:00' THEN t.min_inserted_on ELSE t.min_effective_from END;