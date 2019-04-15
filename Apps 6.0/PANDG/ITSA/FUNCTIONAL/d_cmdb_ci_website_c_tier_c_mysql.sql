SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_cmdb_ci_website_c.tier_c' ELSE 'SUCCESS' END as Message
 FROM
  png_mdsdb.cmdb_ci_web_site_final SRC
 JOIN png_mdwdb.d_cmdb_ci_website_c TRGT
ON SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where case when SRC.u_pg_business_criticality='1 - most critical'  then 'T1' 
           when SRC.u_pg_business_criticality='2 - somewhat critical' then 'T2' 
           when SRC.u_pg_business_criticality='3 - less critical' then 'T3' 
          when SRC.u_pg_business_criticality='4 - not critical' then 'T4' 
          else 'UNSPECIFIED' end <> TRGT.tier_c
