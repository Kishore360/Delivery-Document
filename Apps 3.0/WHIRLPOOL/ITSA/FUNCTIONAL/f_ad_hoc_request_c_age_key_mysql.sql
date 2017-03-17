
 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message 
from whirlpool_mdwdb.f_ad_hoc_request_c f  
LEFT JOIN whirlpool_mdwdb.d_lov L  
ON  floor(f.age/(3600*24)) BETWEEN L.lower_range_value AND L.upper_range_value
 AND L.dimension_class = 'AGEBUCKET_WH~U_AD_HOC_REQUEST' 
WHERE coalesce(L.row_key,-1) <> f.age_key



