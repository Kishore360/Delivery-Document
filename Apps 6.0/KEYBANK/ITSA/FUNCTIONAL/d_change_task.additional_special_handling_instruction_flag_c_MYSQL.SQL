SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_task.additional_special_handling_instruction_flag_c' ELSE 'SUCCESS' END as Message 
FROM keybank_mdsdb.change_task_final SRC
JOIN keybank_mdwdb.d_change_task TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
WHERE case when SRC.u_additional_special_handling_instruction=1 then 'Y' 
when SRC.u_additional_special_handling_instruction=0 then 'N' else 'X' end <> TRGT.additional_special_handling_instruction_flag_c;
