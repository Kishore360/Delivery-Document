SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.cost_center_key'
else 'SUCCESS' end FROM schneider_mdsdb.ctm_people_final SRC
JOIN schneider_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.person_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
JOIN schneider_mdwdb.FIN lkp ON ('SRC.PrimaryCostCenterInstance_ID')=(lkp.row_id) and SRC.instance_id=lkp.source_id
Where COALESCE(lkp.row_key, CASE WHEN SRC.PrimaryCostCenterInstance_ID IS NULL THEN 0 ELSE -1 END) <> TRGT.cost_center_key
