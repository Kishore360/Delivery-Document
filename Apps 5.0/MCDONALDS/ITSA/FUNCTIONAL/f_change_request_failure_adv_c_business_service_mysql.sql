			SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				  FROM
                mcdonalds_mdsdb.change_request_final change_request    
				 LEFT OUTER JOIN
                mcdonalds_mdsdb.cmdb_ci_service_final business_service 
                    ON change_request.u_business_service=business_service.sys_id  and change_request.sourceinstance=business_service.sourceinstance
                    join mcdonalds_mdwdb.f_change_request_failure_adv_c d on change_request.sys_id=d.row_id 
					where  coalesce(business_service.name,'UNSPECIFIED') <> d.business_service
					
					