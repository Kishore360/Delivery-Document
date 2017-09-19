SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.vip_flag'
else 'SUCCESS' end FROM schneider_mdsdb.ctm_people_final SRC
JOIN schneider_mdwdb.d_internal_contact TRGT 
ON CONCAT('INTERNAL_CONTACT','~',SRC.person_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
WHERE (CASE WHEN SRC.vip = 0 THEN 'Y'  ELSE 'N' END) <> TRGT.vip_flag