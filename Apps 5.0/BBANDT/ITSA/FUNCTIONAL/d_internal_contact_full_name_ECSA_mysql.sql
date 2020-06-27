SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
    CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.full_name' ELSE 'SUCCESS' END AS Message
    FROM
    (SELECT  sys_user.sys_id, sys_user.sourceinstance, TRGT.row_id
    FROM bbandt_mdsdb.sys_user_final sys_user
	LEFT JOIN
    bbandt_mdwdb.d_internal_contact TRGT ON (CONCAT('INTERNAL_CONTACT~', sys_user.sys_id) = TRGT.row_id
	AND sys_user.sourceinstance = TRGT.source_id)
	WHERE COALESCE(sys_user.name,'') <> COALESCE(TRGT.full_name, '')
	