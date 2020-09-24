SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.u_fmr_product_final  SRC 
JOIN fidelity_mdwdb.d_fmr_product_c TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join fidelity_mdwdb.d_cost_center LKP
on COALESCE(SRC.u_owner_cost_center, 'UNSPECIFIED') = LKP.row_id and SRC.sourceinstance=LKP.source_id
 WHERE coalesce(LKP.row_key, case when SRC.u_owner_cost_center is null then 0 else -1 end ) <>(TRGT.product_owner_cost_center_c_key) and SRC.cdctype<>'D';
 
 

