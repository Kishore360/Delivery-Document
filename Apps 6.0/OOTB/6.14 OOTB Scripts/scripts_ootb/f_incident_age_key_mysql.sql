
 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
from #DWH_TABLE_SCHEMA.f_incident f  
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov L  
ON ((f.age div 86400.0 BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'WH_AGEBUCKET~INCIDENT' )
WHERE (L.row_key )  <> f.age_key)b
