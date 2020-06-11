SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.changed_on' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.dimperson_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
 ON (concat('INTERNAL_CONTACT~',SRC.personsk) = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
WHERE TRGT.row_key not in (0,-1) and TRGT.soft_deleted_flag = 'N' and 
coalesce(convert_tz(SRC.LastUpdatedDateTime,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '') <> coalesce(TRGT.changed_on,'');