select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_configuration_item_c.age_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
from rogers6_mdwdb.f_configuration_item_c f  
LEFT JOIN rogers6_mdwdb.d_lov L  
ON  (floor((f.age)/(86400.0*365))+0.1  BETWEEN L.lower_range_value AND L.upper_range_value
	AND L.dimension_class = 'WH_CI_AGEBUCKET~CMDB' )
WHERE (L.row_key )  <> f.age_key)b;