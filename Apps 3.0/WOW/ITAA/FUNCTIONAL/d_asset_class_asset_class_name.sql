SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset_class.asset_class_name' ELSE 'SUCCESS' END as Message
FROM wow_mdsdb.sys_db_object_final  SRC 
 INNER JOIN wow_mdwdb.d_asset_class TRGT 
 ON SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id 
 WHERE COALESCE( SRC.name ,'') <> COALESCE(TRGT.asset_class_name ,'');
