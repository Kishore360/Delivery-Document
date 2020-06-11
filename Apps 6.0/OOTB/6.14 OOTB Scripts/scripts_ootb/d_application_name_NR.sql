
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.name' ELSE 'SUCCESS' END as Message
 FROM
 (select TRGT.row_id from 
 #MDS_TABLE_SCHEMA.applications_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_application TRGT 
 ON (concat('APPLICATION~', SRC.id)  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE(SRC.name,'')<> COALESCE(TRGT.name ,'')
union
select TRGT.row_id from 
 #MDS_TABLE_SCHEMA.mobile_applications_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_application TRGT 
 ON (concat('APPLICATION~', SRC.id)  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE(SRC.name,'')<> COALESCE(TRGT.name ,'') ) SQ
 
 