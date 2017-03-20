select 
CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.secondary_age_c_key' 
ELSE 'SUCCESS' END as Message
from 
( select count(1) as cnt
from asu_mdwdb.f_hr_case f  
LEFT JOIN asu_mdwdb.d_lov L  
ON ((f.age BETWEEN L.lower_range_value AND L.upper_range_value) AND L.dimension_class = 'AGE_C~HRCASE' )
WHERE COALESCE(L.row_key, case when f.age is null or f.age = 0 THEN 0 else -1 end ) 
 <> f.age_key) s