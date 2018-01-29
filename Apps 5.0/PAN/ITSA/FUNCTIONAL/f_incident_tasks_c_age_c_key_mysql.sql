-- convert age/86400 and run it and change the dimension class to AGEBUCKET_WH~INCIDENT


SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.notifind_sent_c_flag' ELSE 'SUCCESS' END as Message 
FROM pan_mdwdb.f_incident_tasks_c a
LEFT OUTER JOIN pan_mdwdb.d_lov x ON 
   AND (x.dimension_class = 'AGEBUCKET_WH~ASC_INCIDENT'
    OR x.row_key in (0,-1))
WHERE a.age_c_key <> coalesce(x.row_key, case when a.age is null then 0 else -1 end)
 

 /*
 SELECT a.age_c_key , coalesce(x.row_key, case when a.age is null then 0 else -1 end),
age/86400 , lower_range_value , upper_range_value,dimension_class
FROM pan_mdwdb.f_incident_tasks_c a
LEFT OUTER JOIN pan_mdwdb.d_lov x ON age/86400 between lower_range_value and upper_range_value
   AND (x.dimension_class = 'AGEBUCKET_WH~INCIDENT'
  )
WHERE a.age_c_key <> coalesce(x.row_key, case when age/86400 is null then 0 else -1 end);


select dimension_class,lower_range_value,upper_range_value from pan_mdwdb.d_lov where dimension_class like '%AGEBUCKET_WH~INCIDENT%'*/