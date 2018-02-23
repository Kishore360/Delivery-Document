SELECT 
CASE WHEN CNT > 0 THEN 'Failure' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task.task_sla_c_flag' ELSE 'SUCCESS' END as Messagge
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT a11.task_number,a12.task_key,a11.task_type,a11.task_sla_c_flag,a12.task_flag
FROM nbcu_mdwdb.d_task a11
join (Select task_key,source_id,
CASE WHEN count(sla_key) = SUM(if(stage_src_code='cancelled',1,0)) then 'X'
ELSE 
CASE WHEN SUM(if((stage_src_code<>'cancelled' and breached_c_flag = 'Y'),1,0)) < 1 
THEN CASE WHEN SUM(if((stage_src_code='in_progress' or stage_src_code='paused'),1,0)) > 1
THEN 'P'
ELSE 'Y' END
ELSE 'N'
END
END as task_flag
from nbcu_mdwdb.f_task_sla
where consider_c_flag='Y'
group by 1) a12 
ON a11.row_key= a12.task_key
WHERE  a11.task_sla_c_flag <> a12.task_flag  collate utf8_general_ci
AND a11.task_sla_c_flag is NULL
) a 
) temp;


