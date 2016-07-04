
 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.change_request_age_key' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_change_request f  
LEFT JOIN <<tenant>>_mdwdb.d_lov L  
ON ((f.change_request_age BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'AGEBUCKET_WH~CHANGE_REQUEST' )
WHERE COALESCE(L.row_key, case when f.change_request_age is null or f.change_request_age = 0 THEN 0 else -1 end ) 
 <> f.change_request_age_key

