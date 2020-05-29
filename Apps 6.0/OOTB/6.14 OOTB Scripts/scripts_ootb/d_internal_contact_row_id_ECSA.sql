SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
    CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.row_id' ELSE 'SUCCESS' END AS Message
    FROM
    (SELECT  sys_user.sys_id, sys_user.sourceinstance, TRGT.row_id
    FROM #MDS_TABLE_SCHEMA.sys_user_final sys_user
    left JOIN #MDS_TABLE_SCHEMA.core_company_final core_company ON core_company.sourceinstance = sys_user.sourceinstance
    AND core_company.sys_id = sys_user.company
	LEFT JOIN
    #DWH_TABLE_SCHEMA.d_internal_contact TRGT ON (CONCAT('INTERNAL_CONTACT~', sys_user.sys_id) = TRGT.row_id
	AND sys_user.sourceinstance = TRGT.source_id)
	WHERE COALESCE(CONCAT('INTERNAL_CONTACT~', sys_user.sys_id),'') <> COALESCE(TRGT.row_id, '')
	union 
	SELECT  csm_consumer.sys_id, csm_consumer.sourceinstance,TRGT.row_id
    FROM #MDS_TABLE_SCHEMA.csm_consumer_final csm_consumer
    LEFT JOIN
    #DWH_TABLE_SCHEMA.d_internal_contact TRGT ON concat('CONSUMER~',csm_consumer.sys_id)=TRGT.row_id
	AND csm_consumer.sourceinstance = TRGT.source_id
	WHERE COALESCE(CONCAT('CONSUMER~',csm_consumer.sys_id),'') <> COALESCE(TRGT.row_id, ''))IC;