SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_cmdb_ci_website_c.created_on' ELSE 'SUCCESS' END as Message
 FROM
  png_mdsdb.cmdb_ci_web_site_final SRC
 JOIN png_mdwdb.d_cmdb_ci_website_c TRGT
ON SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where convert_tz(SRC.sys_created_on, "GMT", "America/New_York") <> TRGT.created_on
