
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.created_by' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.synonyms_final SRC_P
LEFT JOIN mercuryins_mdwdb.d_internal_organization TRGT 
ON (SRC_P.sourceinstance =TRGT.source_id 
and CONCAT('GROUP_LEVEL~',acd_no,'~',trim(SRC_P.value)) = TRGT.row_id )
WHERE SRC_P.item_type='grpname' and
'avaya_cms'<> COALESCE(TRGT.created_by,'')

