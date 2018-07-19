SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_archer_application_c.vendor_extended_support_end_date_c' ELSE 'SUCCESS' END as Message FROM bbandt_mdsdb.app_vwarchertonumerifyfeed_final  SRC JOIN bbandt_mdwdb.d_archer_application_c TRGT ON (SRC.application_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.vendor_extended_support_end_date <> (TRGT.vendor_extended_support_end_date_c) 
