SELECT CASE WHEN count(1)>1 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>1 THEN 'MDS to DWH data validation failed for d_application.name' ELSE 'SUCCESS' END as Message
FROM rogers6_mdsdb.cmdb_ci_appl_final SRC
left JOIN rogers6_mdwdb.d_application TRGT
ON (concat('APPLICATION~',ifnull(SRC.sys_id,'')) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
WHERE COALESCE(NULLIF(SRC.name,''),'UNSPECIFIED')<> (TRGT.name);