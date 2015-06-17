

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age_key' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_incident f  
LEFT JOIN <<tenant>>_mdwdb.d_lov L  
ON ((f.dormancy_age BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'DORMANCYBUCKET_WH~INCIDENT' )
WHERE COALESCE(L.row_key, case when f.dormancy_age is null or f.dormancy_age = 0 THEN 0 else -1 end ) 
 <> f.dormancy_age_key
