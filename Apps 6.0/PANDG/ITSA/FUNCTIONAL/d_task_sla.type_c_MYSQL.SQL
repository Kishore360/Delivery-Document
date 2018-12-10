


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task_sla.type_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM pandg_mdsdb.task_final a 
LEFT JOIN pandg_mdsdb.task_sla_final b ON (a.sys_id=b.task AND a.sourceinstance=b.sourceinstance)
LEFT JOIN pandg_mdsdb.contract_sla_final c ON (b.sla=c.sys_id AND b.sourceinstance=c.sourceinstance)
JOIN pandg_mdwdb.d_task_sla d ON (c.sys_id=d.row_id AND c.sourceinstance=d.source_id)
WHERE COALESCE(c.type,'UNSPECIFIED')<>d.type_c

) temp;






