SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_internal_organization.vp_c_key' ELSE 'SUCCESS' END as Message
FROM ingrammicro_mdsdb.sys_user_group_final SRC
JOIN (select right(row_id,32) as row_id,source_id,vp_c_key from ingrammicro_mdwdb.d_internal_organization) TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
JOIN ingrammicro_mdsdb.sys_user_final SRC1 ON SRC.u_vp=SRC1.sys_id and SRC.sourceinstance=SRC1.sourceinstance
JOIN (select right(row_id,32) as row_id,source_id,row_key from ingrammicro_mdwdb.d_internal_contact) LKP ON LKP.row_id=SRC1.sys_id AND SRC1.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC.u_vp IS NULL THEN 0 ELSE -1 END))<>TRGT.vp_c_key ;