SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_location.contact_name' ELSE 'SUCCESS' END as Message from schneider_mdsdb.sit_site_final  SRC 
JOIN
schneider_mdsdb.ctm_people_final LKP
on SRC.site_id=LKP.site_id
JOIN schneider_mdwdb.d_location TRGT 
ON (SRC.site_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
WHERE LKP.full_name <> (TRGT.contact_name) 
