 
				SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.u_expedite_reason_details_c' ELSE 'SUCCESS' END as Message
FROM 
(Select count(1) CNT
FROM  ntrust_mdsdb.task_sla_final SRC
LEFT JOIN
               ntrust_mdsdb.task_final task 
                    ON task.sys_id=SRC.task 
LEFT JOIN ntrust_mdwdb.f_task_sla TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
 Left JOIN ntrust_mdwdb.d_task_sla LKP ON coalesce(SRC.sys_id,'UNSPECIFIED')=LKP.row_id  AND SRC.sourceinstance=LKP.source_id
where case when SRC.sys_id is NULL then 0 else coalesce(LKP.row_key,-1) end <> TRGT2.task_sla_c_key and SRC.cdctype='X') temp;
 
 