
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.vip_flag' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_ctm_people_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
	ON (CONCAT('INTERNAL_CONTACT~',SRC.person_id)=TRGT.row_id  
	AND SRC.sourceinstance = TRGT.source_id)
WHERE (CASE WHEN SRC.vip = 0 THEN 'Y' ELSE 'N' END )<> COALESCE(TRGT.vip_flag,'')
