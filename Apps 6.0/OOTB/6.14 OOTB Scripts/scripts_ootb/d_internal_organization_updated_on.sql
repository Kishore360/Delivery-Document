
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.updated_on' ELSE 'SUCCESS' END as Message
FROM 
( SELECT * FROM #MDS_TABLE_SCHEMA.synonyms_final WHERE CDCTYPE<>'D') SRC_P
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization TRGT 
ON (SRC_P.sourceinstance =TRGT.source_id 
and CONCAT('GROUP_LEVEL~',acd_no,'~',SRC_P.value) = TRGT.row_id )
WHERE SRC_P.item_type='grpname' and
TRGT.updated_on is null


