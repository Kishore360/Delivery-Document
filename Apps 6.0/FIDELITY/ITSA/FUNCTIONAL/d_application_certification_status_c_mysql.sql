SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.audience_outage_c_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.cmdb_ci_appl_final  SRC 
JOIN fidelity_mdwdb.d_application TRGT 
ON (CONCAT('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
WHERE CASE WHEN SRC.u_certification_flag IS FALSE THEN 'Not Certified'
WHEN SRC.u_certification_flag IS TRUE and SRC.u_certification_date is NULL THEN 'Out of Date'
WHEN SRC.u_certification_flag IS TRUE and DATEDIFF(date(now()),date(SRC.u_certification_date))<150  THEN 'Certified'
WHEN SRC.u_certification_flag IS TRUE and (DATEDIFF(date(now()),date(SRC.u_certification_date))>=150 and DATEDIFF(date(now()),date(SRC.u_certification_date))< 180 ) THEN 'Approaching Out of Date'
WHEN SRC.u_certification_flag IS TRUE and (DATEDIFF(date(now()),date(SRC.u_certification_date))>=180) THEN 'Out of Date' END<>(TRGT.certification_status_c) and SRC.cdctype<>'D'

