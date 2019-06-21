										SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				FROM
                mcdonalds_mdsdb.change_request_final change_request                  
            join mcdonalds_mdwdb.d_change_failure_c d on change_request.sys_id=d.row_id 
					coalesce(change_request.short_description,
                'UNSPECIFIED') <> change_short_description
				
				
				