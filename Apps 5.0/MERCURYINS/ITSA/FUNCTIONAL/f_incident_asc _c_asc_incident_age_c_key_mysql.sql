SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.notifind_sent_c_flag' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdwdb.f_incident_asc_c a
LEFT OUTER JOIN mercuryins_mdwdb.d_lov x ON a.age BETWEEN x.lower_range_value AND x.upper_range_value
   AND (x.dimension_class = 'AGEBUCKET_WH~ASC_INCIDENT'
    OR x.row_key in (0,-1))
WHERE a.asc_incident_age_c_key <> coalesce(x.row_key,case when a.age is null then 0 else -1 end )
 
