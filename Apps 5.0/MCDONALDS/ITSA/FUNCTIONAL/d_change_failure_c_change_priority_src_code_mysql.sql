
				
										SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				   FROM
                mcdonalds_mdsdb.change_request_final change_request    
				join mcdonalds_mdwdb.d_change_failure_c d on change_request.sys_id=d.row_id       
LEFT OUTER JOIN
    mcdonalds_mdsdb.sys_choice_final impact ON BINARY change_request.impact = impact.value
        AND change_request.sourceinstance = impact.sourceinstance
        AND impact.element = 'priority'
        AND priority.name = 'task'
        AND priority.language = 'EN'
        AND priority.inactive = 0
		where  coalesce(priority.label,change_request.priority,'UNSPECIFIED') <> change_priority_src_code
		
		
		
				
										