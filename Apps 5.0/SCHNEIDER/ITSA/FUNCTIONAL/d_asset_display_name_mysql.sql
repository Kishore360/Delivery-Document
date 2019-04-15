SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_asset.display_name' ELSE 'SUCCESS' END as Message 
-- select distinct COALESCE(SRC.name,'UNSPECIFIED'),(TRGT.display_name) 
FROM schneider_mdsdb.ast_baseelement_final SRC 
JOIN schneider_mdwdb.d_asset TRGT 
ON SRC.request_id  = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
WHERE COALESCE(SRC.name,'UNSPECIFIED') <> (TRGT.display_name) 
and TRGT.soft_deleted_flag='N';
