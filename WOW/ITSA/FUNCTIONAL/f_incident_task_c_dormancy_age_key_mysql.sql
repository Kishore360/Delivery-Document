 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
 FROM
 (
 SELECT count(1) as cnt from wow_mdwdb.f_incident_task_c a 
LEFT JOIN wow_mdwdb.d_lov b 
ON a.dormancy_age BETWEEN b.lower_range_value AND b.upper_range_value
AND  b.dimension_class = 'DORMANCYBUCKET_WH~INCIDENT'   
WHERE a.dormancy_age_key <> coalesce(b.row_key,-1)
 )a