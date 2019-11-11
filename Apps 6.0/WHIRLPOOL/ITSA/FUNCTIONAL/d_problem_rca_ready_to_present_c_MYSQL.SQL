SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
  FROM( select count(1) as cnt from 
  whirlpool_mdsdb.problem_final SRC
  left join whirlpool_mdwdb.d_problem TRGT
  on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
  where CONVERT_TZ(SRC.u_rca_ready_time,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#')<>TRGT.rca_ready_to_present_c)ma

