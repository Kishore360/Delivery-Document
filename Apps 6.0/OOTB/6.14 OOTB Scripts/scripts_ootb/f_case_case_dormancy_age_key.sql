select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.case_dormancy_age_key' ELSE 'SUCCESS' END as Message
/*select f.row_id, f.case_key,
floor(f.dormancy_age/86400), L.lower_range_value, L.upper_range_value,
COALESCE(L.row_key, -1 ) sr, f.case_dormancy_age_key tg*/
from #DWH_TABLE_SCHEMA.f_case f  
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov L  
ON ((floor(f.dormancy_age/86400) BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'WH_DORMANCYBUCKET~CASE' )
WHERE COALESCE(L.row_key, -1 ) <> f.case_dormancy_age_key;