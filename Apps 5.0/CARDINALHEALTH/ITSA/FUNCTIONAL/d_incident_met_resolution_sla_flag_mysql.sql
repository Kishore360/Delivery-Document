
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
from cardinalhealth_mdwdb.d_incident a join (
SELECT  task , group_concat(distinct has_breached) as outcome_flag 
FROM cardinalhealth_mdsdb.task_sla_final f_sla
JOIN cardinalhealth_mdsdb.task_final inc
on f_sla.task = inc.sys_id
JOIN cardinalhealth_mdsdb.contract_sla_final d_sla ON d_sla.sys_id=f_sla.sla
WHERE stage <> 'CANCELLED' and d_sla.name like '%Resolution%' and type ='SLA' 

group by 1) b on a.row_id = b.task
where a.met_resolution_sla_flag <> CASE WHEN outcome_flag like '%1%' THEN 'N' ELSE 'Y' END
