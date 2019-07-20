SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_cmdb_ci_website_c.department_key' ELSE 'SUCCESS' END as Message
 FROM
  png_mdsdb.cmdb_ci_web_site_final SRC
 JOIN png_mdwdb.f_cmdb_ci_website_c TRGT
ON SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join png_mdwdb.d_internal_organization lkp
on lkp.row_id = ( concat('DEPARTMENT~',SRC.department )) 
AND lkp.source_id=SRC.sourceinstance
where lkp.row_key <> TRGT.department_key
