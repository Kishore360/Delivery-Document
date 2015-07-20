SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.assigned_date' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.alm_asset SRC 
 LEFT JOIN usf_mdwdb.d_asset TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE( convert_tz(SRC.assigned,'GMT','America/Los_Angeles'),'')<> COALESCE(TRGT.assigned_date ,'')
