SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_instance_final.requested_on' ELSE 'SUCCESS' END as Message 
FROM <<tenant>>_mdsdb.task_survey_final SRC
  left join <<tenant>>_mdsdb.survey_instance_final  sif
  on (SRC.instance  = sif.sys_id )
 LEFT JOIN <<tenant>>_mdwdb.d_survey_instance TRGT 
 ON (sif.sys_id  =TRGT.row_id  
 AND sif.sourceinstance = TRGT.source_id  )
-- JOIN  app_test.lsm_ls_source_timezone L 
-- ON (sif.sourceinstance   = L.sourceid )
where COALESCE(CONVERT_TZ(SRC.requested_date,'GMT','America/Los_Angeles'),'00-00-1900 00:00:00')
  <> (TRGT.requested_on);
