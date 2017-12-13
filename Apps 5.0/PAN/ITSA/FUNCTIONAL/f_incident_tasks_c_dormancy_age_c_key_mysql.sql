SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_tasks_c.closed_on_c_key' ELSE 'SUCCESS' END as Message 
from pan_mdwdb.f_incident_tasks_c a 
LEFT JOIN pan_mdwdb.d_lov b 
ON a.dormancy_age BETWEEN b.lower_range_value AND b.upper_range_value  AND 
    b.dimension_class = 'DORMANCYBUCKET_WH~INCIDENT'
WHERE b.row_key <> a.dormancy_age_c_key and current_flag='Y'