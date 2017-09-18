SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_ksr_c.soft_deleted_flag' else 'SUCCESS' end as message
FROM schneider_mdsdb.ks_srv_customersurvey_base_final SRC
JOIN schneider_mdwdb.d_ksr_c TRGT ON SRC.customersurveyid  =  TRGT.row_id and  SRC.sourceinstance = TRGT.source_id  
WHERE coalesce(CASE 
                WHEN SRC.cdctype='D' then 'Y' 
                else 'N' 
            END  ) <> (TRGT.soft_deleted_flag)
