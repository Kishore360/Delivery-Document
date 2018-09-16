SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_fmr_product_c.operational_maturity_rating_src_c_key' ELSE 'SUCCESS' END as Message FROM <<tenant>>_mdsdb.u_fmr_product_final  SRC JOIN <<tenant>>_mdwdb.d_fmr_product_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN <<tenant>>_mdwdb.d_lov LKP ON ( concat( 'OPER_MATURITY_RATING~FMR_PRODUCT_LINE_C~~~' ,upper( SRC.u_operational_maturity_rating)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_operational_maturity_rating IS NULL THEN 0 else -1 end)<> (TRGT.operational_maturity_rating_src_c_key) 
