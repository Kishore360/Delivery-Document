SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_organization.region_c_key' ELSE 'SUCCESS' END as Message
FROM equifax_mdwdb.d_internal_organization trgt
RIGHT JOIN equifax_mdsdb.sys_user_group_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN equifax_mdwdb.d_location lkp
ON COALESCE(src.u_region,'UNSPECIFIED') = lkp.row_id and src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.u_region IS NULL THEN 0 else -1 end) <> region_c_key;