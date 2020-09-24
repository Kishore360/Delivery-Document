			
				
				
					SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.lead_time_c' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt from 

ntrust_mdsdb.change_request_final  SRC 
JOIN
             
              ntrust_mdsdb.sys_user_final sys_user 
                    ON SRC.assigned_to=sys_user.sys_id 
                    and SRC.sourceinstance=sys_user.sourceinstance 
					LEFT OUTER JOIN
                ntrust_mdsdb.core_company_final assignee_company 
                    ON sys_user.company=assignee_company.sys_id 

JOIN ntrust_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 
WHERE 
				
				coalesce( assignee_company.name,
                'UNSPECIFIED' )  <> (TRGT.lead_time) ) temp;	