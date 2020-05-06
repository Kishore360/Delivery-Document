SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
FROM equifax_mdsdb.x_59673_equifax_bu_equifax_business_impact_table_final SRC 
JOIN equifax_mdwdb.d_equifax_bu_equifax_business_impact_c TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id  
WHERE SRC.number  <> TRGT.number_c and SRC.cdctype<>'D')b