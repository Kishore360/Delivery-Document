
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.case_dormancy_age_key' ELSE 'SUCCESS' END as Message
from ibmwatson_mdwdb.f_case f  
LEFT JOIN ibmwatson_mdwdb.d_lov L  
ON ((f.dormancy_age BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'DORMANCYBUCKET_WH~CASE' )
WHERE COALESCE(L.row_key, -1 ) <> f.case_dormancy_age_key and  f.soft_deleted_flag<>'Y'
--  COALESCE(L.row_key, case when f.dormancy_age is null then 0 else -1 end ) 
 