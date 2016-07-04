
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_resource_plan.planned_start_on' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.resource_plan_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_resource_plan TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance   = L.sourceid )
 WHERE SRC.start_date<> TRGT.planned_start_on
