
								SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				FROM
                mcdonalds_mdsdb.change_request_final change_request  
LEFT OUTER JOIN
    mcdonalds_mdsdb.sys_choice_final lov ON BINARY change_request.state = lov.value
        AND change_request.sourceinstance = lov.sourceinstance
        AND lov.element = 'state'
        AND lov.name = 'change_request'
        AND lov.language = 'EN'
        AND lov.inactive = 0				
				join mcdonalds_mdwdb.d_change_failure_c d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id
				 AND ((change_request.state , lov.sys_created_on) IN (SELECT 
            sys_choice.value AS state,
                MAX(sys_choice.sys_created_on) AS max
        FROM
            mcdonalds_mdsdb.sys_choice_final sys_choice
        WHERE
            sys_choice.element = 'state'
                AND sys_choice.name = 'change_request'
                AND sys_choice.language = 'EN'
                AND sys_choice.inactive = 0
        GROUP BY sys_choice.value))
					where  coalesce(lov.label,change_request.state,'UNSPECIFIED')  <> d.change_state_src_code
					
					
					