
 select 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN  CNT >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
from tjx_mdwdb.f_incident f  
LEFT JOIN tjx_mdwdb.d_lov L  
ON ((f.age div 86400 BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'AGEBUCKET_WH~INCIDENT' )
	join tjx_mdwdb.d_lov_map map on f.state_src_key=map.src_key
WHERE coalesce(L.row_key,case when age is null then 0 else -1 end )  <> f.age_key)temp;

