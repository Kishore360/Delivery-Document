SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for f_cmdb_relationship_c.pivot_date' ELSE 'SUCCESS' END as Message from 
pdchs_mdsdb.sit_site_final  SRC 
JOIN pdchs_mdwdb.d_location TRGT 
ON (SRC.site_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
 WHERE COALESCE(convert_tz(SRC.last_modified_date,'GMT','America/Los_Angeles') ,'UNSPECIFIED') <> (TRGT.pivot_date) 