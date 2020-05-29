SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_location.geo_id' ELSE 'SUCCESS' END as Message from schneider_mdsdb.sit_site_final  SRC JOIN schneider_mdwdb.d_location TRGT ON (SRC.site_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.site_id <> (TRGT.geo_id) 
