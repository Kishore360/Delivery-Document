SELECT CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_change_failure.change_group_category_c_key' ELSE 'SUCCESS' END as Message
FROM marriott_mdsdb.sys_user_group_final SRC
left JOIN marriott_mdwdb.d_internal_organization TRGT ON (concat('GROUP~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
left join marriott_mdwdb.d_lov LKP
on COALESCE(CONCAT('GROUP_CATEGORY_C~USER_GROUP','~',UPPER(SRC.u_group_category)),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.u_group_category is null then 0 else -1 end )<> (TRGT.change_group_category_c_key)
;