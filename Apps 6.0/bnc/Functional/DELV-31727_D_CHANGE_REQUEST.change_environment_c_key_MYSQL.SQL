SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for D_CHANGE_REQUEST.change_environment_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select  Count(1) as CNT 
FROM "BNC_CCS_PD_DB"."MDSDB".hlx_chg_infrastructure_change_final SRC   
LEFT JOIN "BNC_CCS_PD_DB"."MDW"."D_CHANGE_REQUEST" TRGT ON SRC.Infrastructure_Change_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN "BNC_CCS_PD_DB"."MDW"."D_LOV" LKP ON 
COALESCE(CONCAT('ENVIRONMENT','~','CHANGE_REQUEST','~',UPPER(SRC.environment)),'UNSPECIFIED')=LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.environment IS NULL THEN 0 ELSE -1 END )<>TRGT.change_environment_c_key AND SRC.cdctype<>'D'
) temp;




