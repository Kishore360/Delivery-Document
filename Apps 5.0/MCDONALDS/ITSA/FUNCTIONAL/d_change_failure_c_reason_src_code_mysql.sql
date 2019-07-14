	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				FROM
                mcdonalds_mdsdb.change_request_final change_request     
				join mcdonalds_mdwdb.d_change_failure_c d on change_request.sys_id=d.row_id  and change_request.sourceinstance=d.source_id      	 
				LEFT OUTER JOIN
    mcdonalds_mdsdb.sys_choice_final reason ON BINARY change_request.u_reason = reason.value
        AND change_request.sourceinstance = reason.sourceinstance
        AND reason.element = 'u_reason'
        AND reason.name = 'change_request'
        AND reason.language = 'EN'
        AND reason.inactive = 0
 AND ((change_request.u_reason , reason.sys_created_on) IN (SELECT 
            sys_choice.value AS reason,
                MAX(sys_choice.sys_created_on) AS max
        FROM
            mcdonalds_mdsdb.sys_choice_final sys_choice
        WHERE
            sys_choice.element = 'u_reason'
                AND sys_choice.name = 'change_request'
                AND sys_choice.language = 'EN'
                AND sys_choice.inactive = 0
        GROUP BY sys_choice.value))
		where coalesce(reason.label,change_request.u_reason,'UNSPECIFIED') <>reason_src_code
		
		
		