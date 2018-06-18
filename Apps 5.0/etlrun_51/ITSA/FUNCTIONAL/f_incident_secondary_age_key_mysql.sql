select CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.secondary_age_c_key' 
ELSE 'SUCCESS' END as Message
from 
( select count(1) as cnt
from wow_mdwdb.f_incident f  
LEFT JOIN wow_mdwdb.d_lov L  
ON ((floor(f.age/(3600*24)) BETWEEN L.lower_range_value AND L.upper_range_value)
 AND L.dimension_class = 'SECONDARYAGEBUCKET_WH~INCIDENT' )
WHERE COALESCE(L.row_key, case when f.age is null and f.age = 0 THEN 0 else -1 end ) 
 <> f.secondary_age_c_key) s;