SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'MDS to DWH data validation failed for d_asset.serial_number_c' ELSE 'SUCCESS' END as Message 
-- select SRC.serial_number,TRGT.serial_number_c
FROM schneider_mdsdb.ast_baseelement_final SRC 
JOIN schneider_mdwdb.d_asset TRGT 
ON SRC.request_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
WHERE coalesce(SRC.serial_number,'UNSPECIFIED') <> (TRGT.serial_number_c) ;