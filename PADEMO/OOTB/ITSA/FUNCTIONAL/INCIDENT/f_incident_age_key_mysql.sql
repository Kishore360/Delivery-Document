/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/

 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_incident f  
LEFT JOIN <<tenant>>_mdwdb.d_lov L  
ON ((f.age BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'AGEBUCKET_WH~INCIDENT' )
WHERE (L.row_key )  <> f.age_key
