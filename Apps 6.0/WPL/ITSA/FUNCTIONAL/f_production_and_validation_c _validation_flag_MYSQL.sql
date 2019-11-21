SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_production_and_validation_c .validation_flag'
 ELSE 'SUCCESS' END as Message 
 FROM wpl_mdsdb.us_PVFN_Sheet1_final SRC
 JOIN wpl_mdwdb.f_production_and_validation_c TRGT 
 ON concat(coalesce(SRC.validated,
                'unspecified'),
                '~',
                coalesce(SRC.number,
                'unspecified'))  = TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  
 WHERE (CASE                   
                    WHEN SRC.validated='Validated'  THEN 'Y'                  
                    ELSE 'N'              
                END)<> (TRGT.validation_flag)
 and SRC.CDCTYPE='X';