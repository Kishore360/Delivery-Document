 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_problem.rca_age_c_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
from rogers6_mdwdb.f_problem f  
LEFT JOIN rogers6_mdwdb.d_lov L  
ON ((floor(f.rca_business_days_c/86400.0)+0.1  BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'WH_RCA_AGEBUCKET~PROBLEM' )
WHERE (L.row_key )  <> f.rca_age_c_key)b