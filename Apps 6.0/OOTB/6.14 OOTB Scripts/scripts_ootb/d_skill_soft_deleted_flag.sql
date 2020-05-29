SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_skill.soft_deleted_flag' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.synonyms_bwd_delta WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_skill TRGT 
	ON (CONCAT(SRC.ACD_NO,'~',VALUE)=TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(TRGT.soft_deleted_flag,'') <> (case when SRC.cdctype = 'D' THEN 'Y' ELSE 'N' end)
AND SRC.item_type = 'split' and TRGT.row_id not in ('unknown','unspecified')
