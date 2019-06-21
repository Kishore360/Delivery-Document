								SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				FROM
                mcdonalds_mdsdb.change_request_final change_request                  
            LEFT OUTER JOIN
                mcdonalds_mdsdb.sys_user_final sys_user 
                    ON change_request.assigned_to=sys_user.sys_id 
                    and change_request.sourceinstance=sys_user.sourceinstance 
				join mcdonalds_mdwdb.d_change_failure_c d on change_request.sys_id=d.row_id 	
					where coalesce(sys_user.u_vendor_name,'UNSPECIFIED') <> assignee_vendor_name
					
					
			