
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from mcdonalds_mdsdb.change_request_final change_request 
join mcdonalds_mdwdb.f_change_request_failure_adv_c d on change_request.sys_id=d.row_id 
LEFT OUTER JOIN
    mcdonalds_mdsdb.sys_choice_final affected_env ON BINARY change_request.u_affected_environment = affected_env.value
        AND change_request.sourceinstance = affected_env.sourceinstance
        AND affected_env.element = 'u_affected_environment'
        AND affected_env.name = 'task'
        AND affected_env.language = 'EN'
        AND affected_env.inactive = 0
                where (affected_env.label) <>d.affected_env;

				
				
				