


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task_sla.type_c' ELSE 'SUCCESS' END as Message
FROM 
(
select c.sys_id,d.row_id,c.type,d.type_c
FROM png_mdsdb.task_final a 
 JOIN png_mdsdb.task_sla_final b ON (a.sys_id=b.task AND a.sourceinstance=b.sourceinstance and sys_class_name='incident' )
JOIN png_mdsdb.contract_sla_final c ON (b.sla=c.sys_id AND b.sourceinstance=c.sourceinstance)
JOIN png_mdwdb.d_task_sla d ON (c.sys_id=d.row_id AND c.sourceinstance=d.source_id)
WHERE c.type<>d.type_c

) temp;






