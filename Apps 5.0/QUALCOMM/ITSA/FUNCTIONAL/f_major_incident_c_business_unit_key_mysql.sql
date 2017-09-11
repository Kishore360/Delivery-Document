SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_major_incident_c.business_unit_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.u_major_incident_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_major_incident_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN qualcomm_mdwdb.d_internal_organization LKP 
 ON ( concat('BUSINESS_UNIT~',u_business_unit_impact)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_business_unit_impact IS NULL THEN 0 else -1 end)<> (TRGT.business_unit_key);