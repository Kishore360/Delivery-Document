SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.u_fmr_product_final SRC
JOIN  fidelity_mdwdb.d_fmr_product_c TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
join fidelity_mdwdb.d_lov LKP
on COALESCE(CONCAT('INSTALL_STATUS~FMR_PRODUCT_C~',SRC.install_status),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.install_status is null then 0 else -1 end) <>TRGT.product_install_status_src_c_key and  SRC.cdctype<>'D'; 