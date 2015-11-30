SELECT made_sla,TRGT.met_sla_flag,TRIM(tsf.stage)
FROM rei_mdsdb.incident_final SRC 
 LEFT JOIN rei_mdwdb.d_incident TRGT 
ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
left join (SELECT DISTINCT a.task, a.stage
from rei_mdsdb.task_sla_final a 
WHERE TRIM(a.stage) = 'breached') tsf
 ON tsf.task= SRC.sys_id
 WHERE  CASE when TRIM(tsf.stage) = 'breached' or made_sla <> 1 then 'N'  else 'Y' END <> TRGT.met_sla_flag 