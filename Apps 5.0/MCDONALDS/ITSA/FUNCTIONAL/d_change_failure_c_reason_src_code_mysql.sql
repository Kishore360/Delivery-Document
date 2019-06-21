	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				FROM
                mcdonalds_mdsdb.change_request_final change_request     
				join mcdonalds_mdwdb.d_change_failure_c d on change_request.sys_id=d.row_id 	
				LEFT OUTER JOIN
    mcdonalds_mdsdb.sys_choice_final reason ON BINARY change_request.u_reason = reason.value
        AND change_request.sourceinstance = reason.sourceinstance
        AND reason.element = 'u_reason'
        AND reason.name = 'change_request'
        AND reason.language = 'EN'
        AND reason.inactive = 0
		where coalesce(reason.label,change_request.u_reason,'UNSPECIFIED') <>reason_src_code
		
		
		