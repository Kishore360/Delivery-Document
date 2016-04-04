/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
  select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.age_key' ELSE 'SUCCESS' END as Message 
 from  <<tenant>>_mdwdb.f_request a
LEFT OUTER JOIN <<tenant>>_mdwdb.d_lov x ON x.dimension_class = 'AGEBUCKET_WH~SC_REQUEST' 
	AND a.age BETWEEN x.lower_range_value AND x.upper_range_value   
WHERE (a.age_key <> x.row_key );

