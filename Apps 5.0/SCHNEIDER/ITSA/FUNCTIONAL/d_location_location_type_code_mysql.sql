SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_location.location_type_code' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.sit_site_final  SRC JOIN schneider_mdwdb.d_location TRGT ON (SRC.instance_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE "Location" <> (TRGT.location_type_code) 
