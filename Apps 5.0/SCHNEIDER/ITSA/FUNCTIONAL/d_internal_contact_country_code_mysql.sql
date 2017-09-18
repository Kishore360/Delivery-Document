SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.country_code' else 'SUCCESS'end
FROM STM_BMC_mdsdb.ctm_people_final SRC
JOIN STM_BMC_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.person_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
WHERE (case when SRC.client_type='Office-Based Employee' then COALESCE(SRC.Site_country,'UNSPECIFIED') 
when SRC.client_type='Home-Based Employee'  then COALESCE(SRC.Home_country,'UNSPECIFIED') end ) <> (TRGT.country_code)
