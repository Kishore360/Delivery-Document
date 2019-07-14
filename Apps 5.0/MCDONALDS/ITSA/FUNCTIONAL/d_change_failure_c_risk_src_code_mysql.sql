	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				   FROM
                mcdonalds_mdsdb.change_request_final change_request    
				join mcdonalds_mdwdb.d_change_failure_c d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id
						 JOIN
    mcdonalds_mdsdb.sys_choice_final risk ON BINARY change_request.risk = risk.value
        AND change_request.sourceinstance = risk.sourceinstance
        AND risk.element = 'risk'
        AND risk.name = 'change_request'
        AND risk.language = 'EN'
        AND risk.inactive = 0
AND ((change_request.risk , risk.sys_created_on) IN (SELECT 
            sys_choice.value AS risk,
                MAX(sys_choice.sys_created_on) AS max
        FROM
            mcdonalds_mdsdb.sys_choice_final sys_choice
        WHERE
            sys_choice.element = 'risk'
                AND sys_choice.name = 'change_request'
                AND sys_choice.language = 'EN'
                AND sys_choice.inactive = 0
        GROUP BY sys_choice.value))
		where coalesce(risk.label,change_request.risk,'UNSPECIFIED') <> risk_src_code
		
		
		