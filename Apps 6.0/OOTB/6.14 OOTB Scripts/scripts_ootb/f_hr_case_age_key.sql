
 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_hr_case.age_key' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.f_hr_case f  
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov L  
ON ((f.age BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'WH_AGEBUCKET~HR_CASE' )
WHERE COALESCE(L.row_key, case when f.age is null or f.age = 0 THEN 0 else -1 end ) 
 <> f.age_key

