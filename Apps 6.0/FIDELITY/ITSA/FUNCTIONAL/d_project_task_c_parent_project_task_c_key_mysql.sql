SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message
FROM  (select Driver.TASK_ID,
                    Driver.sourceinstance,Driver.PARENT_TASK_ID  from( SELECT
                    TASK_ID,
                    sourceinstance,
                    PARENT_TASK_ID,
                    CASE 
                        WHEN cdctype = 'D' THEN 'Y' 
                        ELSE 'N' 
                    END soft_deleted_flag 
                FROM
                    fidelity_mdsdb.wp_tasks_final  
                UNION
                SELECT
                    wp_tasks.TASK_ID ,
                    wp_tasks.sourceinstance ,
                    wp_tasks.PARENT_TASK_ID,
                    CASE 
                        WHEN wp_tasks.cdctype = 'D' THEN 'Y' 
                        ELSE 'N' 
                    END soft_deleted_flag 
                FROM
                    fidelity_mdsdb.wp_tasks_final wp_tasks    
                JOIN
                    fidelity_mdsdb.wp_task_info_final wp_task_info 
                        ON wp_tasks.TASK_INFO_ID =wp_task_info.TASK_INFO_ID 
                        AND wp_tasks.sourceinstance =wp_task_info.sourceinstance 
                ) Driver        
        LEFT OUTER JOIN
            fidelity_mdsdb.wp_tasks_final wp_tasks  
                ON wp_tasks.TASK_ID = Driver.TASK_ID 
                AND wp_tasks.sourceinstance = Driver.sourceinstance  
        LEFT OUTER JOIN
            fidelity_mdsdb.wp_task_info_final wp_task_info 
                ON wp_tasks.TASK_INFO_ID =wp_task_info.TASK_INFO_ID 
                AND wp_tasks.sourceinstance =wp_task_info.sourceinstance  ) SRC
JOIN  fidelity_mdwdb.d_project_task_c TRGT 
ON (SRC.TASK_ID= TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
join fidelity_mdwdb.d_project_task_c LKP
on COALESCE(SRC.PARENT_TASK_ID,'UNSPECIFIED')=LKP.row_id
WHERE COALESCE(LKP.row_key,case when SRC.PARENT_TASK_ID is null then 0 else -1 end ) <> TRGT.parent_project_task_c_key; 