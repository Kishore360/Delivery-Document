SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_ext_company_c' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdsdb.incident_final SRC
JOIN fidelity_mdwdb.d_incident trgt1
on SRC.sys_id = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
WHERE coalesce(SRC.u_ext_company,'Unspecified') <>trgt1.u_ext_company_c and SRC.cdctype<>'D'



