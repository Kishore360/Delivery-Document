
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.age_key' ELSE 'SUCCESS' END as Message
from ibmwatson_mdwdb.f_case f  
LEFT JOIN ibmwatson_mdwdb.d_lov L  
ON ((f.age BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'AGEBUCKET_WH~CASE' )
WHERE L.row_key <> f.case_age_key and  f.soft_deleted_flag<>'Y'
-- COALESCE(L.row_key, case when f.age is null or f.age = 0 THEN 0 else -1 end ) 
