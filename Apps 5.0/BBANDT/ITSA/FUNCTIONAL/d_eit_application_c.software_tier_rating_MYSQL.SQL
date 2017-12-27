
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_eit_application_c.software_tier_rating' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT 
FROM bbandt_mdsdb.cmdb_ci_spkg_final SRC 
JOIN bbandt_mdwdb.d_eit_application_c TRGT ON (SRC.sys_id and TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where coalesce(SRC.u_tier_rating,'UNSPECIFIED')<>TRGT.software_tier_rating
)temp;