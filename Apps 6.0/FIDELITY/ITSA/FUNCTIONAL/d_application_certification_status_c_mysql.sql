SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.audience_outage_c_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.cmdb_ci_appl_final  SRC 
JOIN fidelity_mdwdb.d_application TRGT 
ON (CONCAT('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
WHERE TRGT.certification_status_c <> CASE WHEN  CONVERT_TZ(CONVERT_TZ(SRC.u_certification_date,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT') is NULL THEN 'Not Certified'
WHEN  DATEDIFF(date(CONVERT_TZ((select max(lastupdated) from fidelity_mdwdb.d_o_data_freshness where source_id =2),'America/Los_Angeles','GMT')),date(CONVERT_TZ(CONVERT_TZ(SRC.u_certification_date,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT')))<150  THEN 'Certified'
WHEN  (DATEDIFF(date(CONVERT_TZ((select max(lastupdated) from fidelity_mdwdb.d_o_data_freshness where source_id =2),'America/Los_Angeles','GMT')),date(CONVERT_TZ(CONVERT_TZ(SRC.u_certification_date,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT')))>=150 and DATEDIFF(date(CONVERT_TZ((select max(lastupdated) from fidelity_mdwdb.d_o_data_freshness where source_id =2),'America/Los_Angeles','GMT')),date(CONVERT_TZ(CONVERT_TZ(SRC.u_certification_date,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT')))< 180 ) THEN 'Approaching Out of Date'
WHEN (DATEDIFF(date(CONVERT_TZ((select max(lastupdated) from fidelity_mdwdb.d_o_data_freshness where source_id =2),'America/Los_Angeles','GMT')),date(CONVERT_TZ(CONVERT_TZ(SRC.u_certification_date,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT')))>=180) THEN 'Out of Date' END and SRC.cdctype<>'D'

