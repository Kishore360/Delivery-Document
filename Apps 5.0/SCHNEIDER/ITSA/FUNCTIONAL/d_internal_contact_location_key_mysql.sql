SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.location_key'
else 'SUCCESS' end FROM schneider_mdsdb.ctm_people_final SRC
JOIN schneider_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.person_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id
join schneider_mdwdb.d_location LKP ON SRC.site_id = LKP.row_id AND SRC.sourceinstance = LKP.source_id   
where COALESCE(LKP.row_key,CASE WHEN SRC.site_id IS NULL THEN 0 else -1 end) <> TRGT.location_key
