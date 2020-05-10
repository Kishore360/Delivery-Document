SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_cmdb_ci_website_c.pg_environment_c_key' ELSE 'SUCCESS' END as Message
 FROM
  png_mdsdb.cmdb_ci_web_site_final SRC
 JOIN png_mdwdb.d_cmdb_ci_website_c TRGT
ON SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id and SRC.cdctype<>'D'
JOIN png_mdwdb.d_lov l
ON COALESCE(concat('ENVIRONMENT_C','~','WEBSITE~',SRC.u_pg_environment),'UNSPECIFIED')=l.row_id 
AND SRC.sourceinstance=l.source_id
where COALESCE(l.row_key,CASE WHEN SRC.u_pg_environment  IS NULL THEN 0 else -1 end) <> TRGT.pg_environment_c_key

