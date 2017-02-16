
 select 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
from cardinalhealth_mdwdb.f_change_request f  
LEFT JOIN cardinalhealth_mdwdb.d_lov L
ON (L.dimension_class = 'AGEBUCKET_WH~CHANGE_REQUEST' OR L.row_key IN (0,-1))
AND  floor(f.change_request_age/(24*3600)) >= L.lower_range_value
AND  floor(f.change_request_age/(24*3600)) <= L.upper_range_value
WHERE (L.row_key )<>f.change_request_age_key OR f.change_request_age_key IS NULL)temp;
 