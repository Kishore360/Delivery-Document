

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.dormancy_age_key' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.f_case f  
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov L  
ON ((f.dormancy_age BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'DORMANCYBUCKET_WH~CASE' )
WHERE COALESCE(L.row_key, -1 ) 
 <> f.dormancy_age_key
