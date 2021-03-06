SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_archer_application_c.original_production_date_c' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from truist_mdsdb.app_vwarchertonumerifyfeed_final  SRC
 JOIN truist_mdwdb.d_archer_application_c TRGT ON (SRC.application_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE SRC.original_production_date <> (TRGT.original_production_date_c) 
 and SRC.cdchash<>'D' and TRGT.soft_deleted_flag='N')ma
