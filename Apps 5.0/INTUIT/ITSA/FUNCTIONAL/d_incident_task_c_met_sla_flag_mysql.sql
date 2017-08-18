

SELECT  t.met_sla_flag,tbd.outcome_flag,s.made_sla
from intuit_mdsdb.u_incident_task_final s
LEFT JOIN intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN
  (SELECT incident_task_c_key, CASE WHEN (Count(incident_task_c_key)- Sum(CASE WHEN outcome_flag= 'N' THEN 1 ELSE 0 END)) = 0 THEN 'Y' ELSE 'N' END AS outcome_flag
   FROM intuit_mdwdb.f_task_sla
   where incident_task_c_key <> -1
   GROUP BY incident_task_c_key) AS tbd ON t.row_key=tbd.incident_task_c_key
where  t.met_sla_flag <> coalesce(tbd.outcome_flag)