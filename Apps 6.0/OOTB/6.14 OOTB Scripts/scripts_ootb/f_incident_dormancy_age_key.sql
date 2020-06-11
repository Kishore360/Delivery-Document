select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for  ' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.f_incident f  
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov L  
ON ((floor(f.dormancy_age/(24*60*60)) BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'WH_DORMANCYBUCKET~INCIDENT' )
WHERE (case when f.dormancy_age is null then null
     when f.dormancy_age is not null and L.row_key is null then -1
     else L.row_key end )
 <> f.dormancy_age_key
