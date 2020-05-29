
 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.change_request_age_key' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.f_change_request f  
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov L  
ON ((FLOOR(f.change_request_age/(24*60*60)) BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'WH_AGEBUCKET~CHANGE_REQUEST' )
WHERE (case when f.change_request_age is null then null
     when (f.change_request_age is not null and L.row_key is null) then -1
     else L.row_key end )
 <> f.change_request_age_key

