
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.city_code' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.us_d_location_final SRC 
LEFT JOIN qualcomm_mdwdb.d_location TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.city_code,'')<> COALESCE(TRGT.city_code,'')
