SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_psat_scorecard_report_c.tier_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM   png_mdsdb.u_pg_cs_scanning_final SRC 
JOIN   png_mdsdb.cmdb_ci_web_site_final  SRC1
ON    SRC.u_touchpoint_name=SRC1.sys_id  
LEFT JOIN png_mdwdb.d_dgtl_psat_scorecard_report_c TRGT 
ON SRC.Sys_id = TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id

WHERE case 
                    when SRC1.u_pg_business_criticality='1 - most critical'  then 'T1' 
                    when SRC1.u_pg_business_criticality='2 - somewhat critical' then 'T2' 
                    when SRC1.u_pg_business_criticality='3 - less critical' then 'T3' 
                    when SRC1.u_pg_business_criticality='4 - not critical' then 'T4' 
                    else 'UNSPECIFIED' 
                end   <> TRGT.tier_c
AND SRC.cdctype<>'D'
) temp;


