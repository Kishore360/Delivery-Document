SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
FROM equifax_mdsdb.u_efx_application_final SRC 
JOIN equifax_mdwdb.d_efx_application_c TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id 
join
equifax_mdwdb.d_lov lkp
on COALESCE(CONCAT('CUSTOMER_TYPE~EFX_APPLICATION~',SRC.u_efx_customer_type),'UNSPECIFIED') =lkp.row_id
WHERE COALESCE(lkp.row_key, case when SRC.u_efx_customer_type is null then 0 else -1 end) <> TRGT.efx_customer_type_c_key and SRC.cdctype<>'D')b