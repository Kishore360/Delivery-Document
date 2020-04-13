SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_application.application_name_c' ELSE 'SUCCESS' END as Message
FROM rogersdev6_mdsdb.cmdb_ci_appl_final SRC
left JOIN rogersdev6_mdwdb.d_application TRGT
ON (concat('APPLICATION~',ifnull(SRC.sys_id,'')) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
and SRC.cdctype<>'D'
WHERE COALESCE(SRC.u_application_name,'UNSPECIFIED')<> (TRGT.application_name_c);