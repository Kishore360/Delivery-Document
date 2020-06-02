SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.soft_deleted_flag' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.user_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
	ON (concat('INTERNAL_CONTACT~',SRC.key) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id)
WHERE SRC.key <> '' and COALESCE(case when SRC.cdctype = 'D' then 'Y' else 'N' end,'')<> COALESCE(TRGT.soft_deleted_flag,'');