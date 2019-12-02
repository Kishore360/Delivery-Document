SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_production_and_validation_c.validation_flag' ELSE 'SUCCESS' END as Message 
FROM whirlpool_mdsdb.us_PVFN_Sheet1_final  SRC 
JOIN whirlpool_mdwdb.f_production_and_validation_c TRGT 
ON (SRC.number = TRGT.change_number AND SRC.sourceinstance = TRGT.source_id )  
where CASE  
                WHEN SRC.validated='Validated'  THEN 'Y' 
                ELSE 'N' 
            END<> (TRGT.validation_flag) and SRC.cdctype='X';
