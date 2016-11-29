
 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message
from molinahealth_mdwdb.f_incident f  
LEFT JOIN molinahealth_mdwdb.d_lov L  
ON ((f.age div 86400 BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'AGEBUCKET_WH~INCIDENT' )
	join molinahealth_mdwdb.d_lov_map map on f.state_src_key=map.src_key
WHERE dimension_wh_code<>'CANCELLED' and coalesce(L.row_key,case when age is null then 0 else -1 end )  <> f.age_key

