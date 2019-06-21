	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				   FROM
                mcdonalds_mdsdb.change_request_final change_request    
				join mcdonalds_mdwdb.f_change_request_failure_adv_c d on change_request.sys_id=d.row_id 
						LEFT OUTER JOIN
    mcdonalds_mdsdb.sys_choice_final risk ON BINARY change_request.risk = risk.value
        AND change_request.sourceinstance = risk.sourceinstance
        AND risk.element = 'risk'
        AND risk.name = 'change_request'
        AND risk.language = 'EN'
        AND risk.inactive = 0
		where coalesce(risk.label,change_request.risk,'UNSPECIFIED') <> risk_src_code
		
		
		
		
		