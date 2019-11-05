 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.age_sdds_c_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
from rogers6_mdwdb.f_incident f
join rogers6_mdwdb.d_incident d  on (f.incident_key=d.row_key and f.source_id=d.source_id)
LEFT JOIN rogers6_mdwdb.d_lov L  
ON (L.dimension_class = 'WH_AGEBUCKET_SDDS~INCIDENT' and 
(d.age  BETWEEN L.lower_range_value AND L.upper_range_value) )
WHERE (L.row_key )  <> f.age_sdds_c_key)a;
