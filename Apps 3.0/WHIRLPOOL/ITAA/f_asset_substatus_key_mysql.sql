SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_substatus_key' ELSE 'SUCCESS' END as Message
FROM whirlpool_mdsdb.alm_asset_final SRC 
JOIN whirlpool_mdwdb.f_asset TRGT 
 ON ( SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id) 
 LEFT JOIN whirlpool_mdwdb.d_lov LKP 
 ON (CASE WHEN  SRC.install_status ='13' THEN 'ASSET~SUBSTATUS~~LOST'
                                                WHEN  SRC.install_status ='18' THEN 'ASSET~SUBSTATUS~~STOLEN'
                                                WHEN  SRC.install_status ='17' THEN 'ASSET~SUBSTATUS~~SOLD'
                                                WHEN  SRC.install_status ='10' THEN 'ASSET~SUBSTATUS~~DONATED' ELSE
COALESCE(CONCAT('ASSET~SUBSTATUS~~',SRC.substatus),'UNSPECIFIED') END) =LKP.row_id 
AND (SRC.sourceinstance )= LKP.source_id 
 WHERE COALESCE(LKP.row_key, CASE WHEN SRC.substatus IS NULL  THEN 0 else '-1' end)<> COALESCE(TRGT.asset_substatus_key,'')

 
 
