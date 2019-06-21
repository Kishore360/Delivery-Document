
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from mcdonalds_mdsdb.change_request_final change_request 
join mcdonalds_mdwdb.d_change_failure_c d on change_request.sys_id=d.row_id 
   JOIN
    mcdonalds_mdsdb.sys_choice_final app_state ON BINARY change_request.approval = app_state.value
        AND change_request.sourceinstance = app_state.sourceinstance
        AND app_state.element = 'approval'
        AND app_state.name = 'task'
        AND app_state.language = 'EN'
        AND app_state.inactive = 0
		where coalesce(app_state.label,change_request.approval) <> approval_state_src_code
		
		
		