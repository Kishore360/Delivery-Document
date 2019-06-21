			SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				  FROM
                mcdonalds_mdsdb.change_request_final change_request    
				join mcdonalds_mdwdb.f_change_request_failure_adv_c d on change_request.sys_id=d.row_id 
				where COALESCE(TIMESTAMPDIFF(SECOND,
                '1970-01-01 00:00:00',
                change_request.u_estimated_efforts),
                0) <> estimated_efforts_c
				
				
				
				
