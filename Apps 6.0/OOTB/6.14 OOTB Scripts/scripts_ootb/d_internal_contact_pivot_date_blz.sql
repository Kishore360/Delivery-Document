SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.pivot_date' ELSE 'SUCCESS' END as Message 
FROM
(select * from #MDS_TABLE_SCHEMA.blz_user_final) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
ON CONCAT('INTERNAL_CONTACT~',SRC.ID) =TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id
WHERE  COALESCE(TRGT.pivot_date,'') <> COALESCE(NULL,'')