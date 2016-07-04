

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.case_dormancy_age_key' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_case f  
LEFT JOIN <<tenant>>_mdwdb.d_lov L  
ON ((f.dormancy_age BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'DORMANCYBUCKET_WH~CASE' )
WHERE COALESCE(L.row_key, -1 ) 
 <> f.case_dormancy_age_key
