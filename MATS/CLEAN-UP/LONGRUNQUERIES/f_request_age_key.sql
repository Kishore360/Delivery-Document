

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.age_key' ELSE 'SUCCESS' END as Message from (
select COALESCE(L.row_key, case when ((f.age is null) or (f.age = 0)) THEN 0 else -1 end )ABC , f.age_key DEF
from uclahealth_mdwdb.f_request f  
LEFT JOIN uclahealth_mdwdb.d_lov L  
ON ( f.state_src_code=L.dimension_code and (f.age BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'AGEBUCKET_WH~SC_REQUEST' ))a
WHERE ABC<>DEF


