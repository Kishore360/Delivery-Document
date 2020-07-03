SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_archer_application_c.organizational_unit_owner_c' ELSE 'SUCCESS' END as Message FROM truist_mdsdb.app_vwarchertonumerifyfeed_final  SRC JOIN truist_mdwdb.d_archer_application_c TRGT ON (SRC.application_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.organizational_unit_owner <> (TRGT.organizational_unit_owner_c) 
and SRC.cdctype='X'
