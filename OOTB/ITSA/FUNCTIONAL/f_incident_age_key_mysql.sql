
 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_incident f  
LEFT JOIN <<tenant>>_mdwdb.d_lov L  
ON ((f.age BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'AGEBUCKET_WH~INCIDENT' )
WHERE COALESCE(L.row_key, -1 ) 
 <> f.age_key
