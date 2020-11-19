SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.u_fmr_product_line_final  SRC 
JOIN fidelity_mdwdb.d_fmr_product_line_c TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join  fidelity_mdwdb.d_lov LKP
on  COALESCE(CONCAT('OPER_MATURITY_RATING~FMR_PRODUCT_LINE_C~', SRC.u_operational_maturity_rating), 'UNSPECIFIED')= LKP.row_id and
SRC.sourceinstance=LKP.source_id
 WHERE coalesce(LKP.row_key, case when SRC.u_operational_maturity_rating is null then 0 else -1 end )  <>(TRGT.operational_maturity_rating_src_c_key) and SRC.cdctype<>'D';
 
 

