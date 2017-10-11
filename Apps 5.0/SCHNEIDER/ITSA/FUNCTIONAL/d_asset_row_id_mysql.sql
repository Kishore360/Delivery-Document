SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_asset.row_id' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.v_r_system_final SRC JOIN schneider_mdwdb.d_asset TRGT 
ON SRC.resourceid   = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
WHERE SRC.resourceid > (TRGT.row_id) 
