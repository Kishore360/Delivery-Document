SELECT 

 CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.service_offering_c_key' ELSE 'SUCCESS' END as Message
FROM pandg_mdsdb.problem_final src 
LEFT JOIN pandg_mdwdb.f_problem trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
LEFT JOIN pandg_mdwdb.d_configuration_item lkp ON src.service_offering = lkp.row_id AND src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.service_offering IS NULL THEN 0 else -1 end) <> (trgt.service_offering_c_key);



