SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_cmdb_ci_website_c.web_business_critical_c_key' ELSE 'SUCCESS' END as Message
 FROM
  png_mdsdb.cmdb_ci_web_site_final SRC
 JOIN png_mdwdb.d_cmdb_ci_website_c TRGT
ON SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_lov l
ON COALESCE(concat('BUSINESS_CRITICAL_C','~','WEBSITE~',SRC.u_pg_business_criticality),'UNSPECIFIED')=l.row_id 
AND SRC.sourceinstance=l.source_id
where COALESCE(l.row_key,CASE WHEN SRC.u_pg_business_criticality IS NULL THEN 0 else -1 end)<>TRGT.web_business_critical_c_key

