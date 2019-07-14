
				
										SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				   FROM
                mcdonalds_mdsdb.change_request_final change_request    
				join mcdonalds_mdwdb.d_change_failure_c d on change_request.sys_id=d.row_id   and change_request.sourceinstance=d.source_id    
LEFT OUTER JOIN
    mcdonalds_mdsdb.sys_choice_final priority ON BINARY change_request.priority = priority.value
        AND change_request.sourceinstance = priority.sourceinstance
        AND priority.element = 'priority'
        AND priority.name = 'task'
        AND priority.language = 'EN'
        AND priority.inactive = 0
		AND ((change_request.priority , priority.sys_created_on) IN (SELECT 
            sys_choice.value AS priority,
                MAX(sys_choice.sys_created_on) AS max
        FROM
            mcdonalds_mdsdb.sys_choice_final sys_choice
        WHERE
            sys_choice.element = 'priority'
                AND sys_choice.name = 'task'
                AND sys_choice.language = 'EN'
                AND sys_choice.inactive = 0
        GROUP BY sys_choice.value))
		where  coalesce(priority.label,change_request.priority,'UNSPECIFIED') <> change_priority_src_code
		
		