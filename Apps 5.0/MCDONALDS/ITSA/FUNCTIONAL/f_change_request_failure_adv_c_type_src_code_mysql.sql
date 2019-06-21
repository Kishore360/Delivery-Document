SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				   FROM
                mcdonalds_mdsdb.change_request_final change_request    
				join mcdonalds_mdwdb.f_change_request_failure_adv_c d on change_request.sys_id=d.row_id   
				LEFT OUTER JOIN
    mcdonalds_mdsdb.sys_choice_final type_src ON BINARY change_request.type = type_src.value
        AND change_request.sourceinstance = type_src.sourceinstance
        AND type_src.element = 'type'
        AND type_src.name = 'change_request'
        AND type_src.language = 'EN'
        AND type_src.inactive = 0
        AND ((change_request.type , type_src.sys_created_on) IN (SELECT 
            sys_choice.value AS type,
                MAX(sys_choice.sys_created_on) AS max
        FROM
            mcdonalds_mdsdb.sys_choice_final sys_choice
        WHERE
            sys_choice.element = 'type'
                AND sys_choice.name = 'change_request'
                AND sys_choice.language = 'EN'
                AND sys_choice.inactive = 0
        GROUP BY sys_choice.value))
		where coalesce(type_src.label,change_request.type,'UNSPECIFIED') <> type_src_code
		
		
		
		
		
		
		
		