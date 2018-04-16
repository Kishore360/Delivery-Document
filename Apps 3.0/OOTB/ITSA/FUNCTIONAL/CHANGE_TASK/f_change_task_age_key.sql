
 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.age_key' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_change_task f  
LEFT JOIN <<tenant>>_mdwdb.d_lov L  
ON ((FLOOR(f.age/(24*60*60)) BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'AGEBUCKET_WH~CHANGE_TASK' )
WHERE (case when f.age is null then null
     when (f.age is not null and L.row_key is null) then -1
     else L.row_key end )
 <> f.age_key
