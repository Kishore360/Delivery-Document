	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				   FROM
                mcdonalds_mdsdb.change_request_final change_request 
join mcdonalds_mdwdb.d_change_failure_c d on change_request.sys_id=d.row_id 				
				LEFT OUTER JOIN
                mcdonalds_mdsdb.cmdb_ci_final cmdb_ci 
                    ON change_request.cmdb_ci=cmdb_ci.sys_id 
                    AND change_request.sourceinstance=cmdb_ci.sourceinstance
				LEFT OUTER JOIN
                mcdonalds_mdsdb.sys_db_object_final sdof 
                    ON cmdb_ci.sys_class_name=sdof.name 
                    and cmdb_ci.sourceinstance=sdof.sourceinstance   
					where coalesce(sdof.label,'UNSPECIFIED') <> d.ci_class
					
					
					