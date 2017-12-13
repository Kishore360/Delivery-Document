
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.work_phone' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.us_d_location_final SRC_P
LEFT JOIN qualcomm_mdsdb._final SRC
ON () 
LEFT JOIN qualcomm_mdwdb.d_location TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.work_phone IS NOT NULL
