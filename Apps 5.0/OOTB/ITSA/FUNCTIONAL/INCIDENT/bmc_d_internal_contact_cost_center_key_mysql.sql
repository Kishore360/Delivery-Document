SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.cost_center_key'
ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.CTM_PEOPLE SRC
JOIN schneider_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.remedy_login_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
JOIN schneider_mdwdb.FIN lkp ON ('SRC.PrimaryCostCenterInstance_ID')=(lkp.row_id) and SRC.instance_id=lkp.source_id
Where COALESCE(lkp.row_key, CASE WHEN SRC.PrimaryCostCenterInstance_ID IS NULL THEN 0 ELSE -1 END) <> TRGT.cost_center_key
