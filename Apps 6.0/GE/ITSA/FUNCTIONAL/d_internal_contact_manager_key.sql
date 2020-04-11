SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.manager_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT suser.sys_id, suser.manager, suser.sourceinstance, 
case when suser.manager is null then 0 
when suser.manager is not null and muser.row_key is not null then muser.row_key 
when suser.manager is not null and muser.row_key is null then -1 end as manager_key 
FROM ge_mdsdb.sys_user_final suser LEFT OUTER JOIN
ge_mdwdb.d_internal_contact muser
ON muser.row_id=concat('INTERNAL_CONTACT~',suser.manager)
AND suser.sourceinstance =muser.source_id
) SRC
LEFT JOIN 
ge_mdwdb.d_internal_contact TRGT 
	ON (concat('INTERNAL_CONTACT~',SRC.sys_id)=TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.manager_key,'')<> COALESCE(TRGT.MANAGER_KEY,'')