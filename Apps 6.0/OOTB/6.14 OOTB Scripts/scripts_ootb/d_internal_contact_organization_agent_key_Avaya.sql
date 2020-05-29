SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_organization.agent id' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.agroups_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact_organization TRGT 
 ON (concat(acd_no,'~',trim(item_name),'~',value) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id ) 
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact INTCONT
 ON (CONCAT('INTERNAL_CONTACT~',SRC.acd_no,'~',SRC.value) = INTCONT.row_id
 AND SRC.sourceinstance =INTCONT.source_id )
WHERE COALESCE(INTCONT.row_key, -1) <> COALESCE(TRGT.agent_key ,'')
