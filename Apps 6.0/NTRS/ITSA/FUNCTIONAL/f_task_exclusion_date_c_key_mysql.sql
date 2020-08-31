

				SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.u_expedite_reason_details_c' ELSE 'SUCCESS' END as Message
FROM 
(Select count(1) CNT
FROM  ntrust_mdsdb.task_final SRC
LEFT JOIN ntrust_mdwdb.f_task TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
LEFT JOIN ntrust_mdwdb.d_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT2.source_id)
 Left JOIN ntrust_mdwdb.d_infosys_exclusion_file_c LKP ON TRGT.task_number=LKP.number_c  AND SRC.sourceinstance=LKP.source_id
where  LKP.exclusion_date_c_key <> TRGT2.month_c and SRC.cdctype='X') temp;


