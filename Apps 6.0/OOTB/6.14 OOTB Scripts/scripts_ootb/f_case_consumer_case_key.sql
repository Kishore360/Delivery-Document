SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.consumer_case_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_customerservice_case_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
	ON LKP.row_id = concat('CONSUMER~',SRC.consumer) and LKP.source_id = SRC.sourceinstance   	    
WHERE coalesce(LKP.row_key,case WHEN SRC.consumer is null then 0 else -1 END ) <> COALESCE(TRGT.consumer_case_key,'')