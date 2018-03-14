SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN CNT > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT a.task_key,Count(a.sla_key) AS SLA_CNT,
CASE WHEN Count(a.sla_key)= 
SUM(if(a.stage_src_code='cancelled',1,0)) THEN 'X'
ELSE 
CASE WHEN SUM(if((stage_src_code <>'cancelled' and breached_c_flag = 'Y'),1,0)) < 1
THEN CASE WHEN SUM(if((stage_src_code='in_progress' or stage_src_code='paused'),1,0)) >= 1
THEN 'P'
ELSE 'Y'
END 
ELSE 'N'
END 
END as Task_flag
FROM nbcu_mdwdb.f_task_sla a 
where consider_c_flag='Y'
group by 1
) a 
JOIN nbcu_mdwdb.d_task b  ON a.task_key=b.row_key
Where a.Task_flag<>b.task_sla_c_flag
)temp; 




