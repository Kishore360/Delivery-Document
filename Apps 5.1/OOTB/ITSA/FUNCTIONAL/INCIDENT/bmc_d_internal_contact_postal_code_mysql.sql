SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_internal_contact.postal_code' else 'SUCCESS' end as message 
FROM schneider_mdsdb.ctm_people_final SRC
JOIN schneider_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.remedy_login_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
WHERE (case when SRC.client_type='Office-Based Employee' then COALESCE(SRC.Site_Zip_Postal_Code,'UNSPECIFIED') 
when SRC.client_type='Home-Based Employee'  then COALESCE(SRC.home_Zip_Postal_Code,'UNSPECIFIED') else COALESCE(SRC.default_zip_postal_code,'UNSPECIFIED') end ) <> (TRGT.postal_code)
