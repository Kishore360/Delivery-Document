
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from mcdonalds_mdsdb.change_request_final change_request 
join mcdonalds_mdwdb.d_change_failure_c d on change_request.sys_id=d.row_id  and change_request.sourceinstance=d.source_id      
   JOIN
    mcdonalds_mdsdb.sys_choice_final app_state ON BINARY change_request.approval = app_state.value
        AND change_request.sourceinstance = app_state.sourceinstance
        AND app_state.element = 'approval'
        AND app_state.name = 'task'
        AND app_state.language = 'EN'
        AND app_state.inactive = 0
		AND ((change_request.approval , app_state.sys_created_on) IN (SELECT 
            sys_choice.value AS approval,
                MAX(sys_choice.sys_created_on) AS max
        FROM
            mcdonalds_mdsdb.sys_choice_final sys_choice
        WHERE
            sys_choice.element = 'approval'
                AND sys_choice.name = 'task'
                AND sys_choice.language = 'EN'
                AND sys_choice.inactive = 0
        GROUP BY sys_choice.value))
		where coalesce(app_state.label,change_request.approval) <> approval_state_src_code
		
		
		