SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_fmr_product_line_c.number_c' ELSE 'SUCCESS' END as Message FROM <<tenant>>_mdsdb.u_fmr_product_line_final  SRC JOIN <<tenant>>_mdwdb.d_fmr_product_line_c TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.u_number <> (TRGT.number_c) 
