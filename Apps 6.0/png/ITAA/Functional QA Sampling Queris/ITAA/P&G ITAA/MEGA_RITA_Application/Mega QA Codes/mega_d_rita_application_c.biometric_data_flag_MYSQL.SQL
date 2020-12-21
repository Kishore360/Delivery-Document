

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.biometric_data_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM pandg_mdsdb.pg_mega_pgb_application_rita_final SRC  
LEFT JOIN pandg_mdsdb.pg_mega_pgv_application_data_model_final SRC1 ON SRC.NAME=SRC1.APP_HEX AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN pandg_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(CASE WHEN SRC1.ATTRIBUTE_NAME ='Biometric data' THEN 'Y' ELSE 'N' END )<> TRGT.biometric_data_flag
AND SRC.cdctype<>'D'
)temp;


