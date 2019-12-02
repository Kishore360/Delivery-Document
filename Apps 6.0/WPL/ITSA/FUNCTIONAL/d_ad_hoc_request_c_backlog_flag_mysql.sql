SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM wpl_mdsdb.u_ad_hoc_request_final SRC 
 LEFT JOIN wpl_mdwdb.d_ad_hoc_request_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN  wpl_mdwdb.f_ad_hoc_request_c TRGTF 
 ON (TRGTF.ad_hoc_request_c_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
  LEFT JOIN wpl_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key and LM.dimension_class='STATE~U_AD_HOC_REQUEST'
WHERE ( CASE WHEN LM.dimension_wh_code IN ('OPEN') THEN 'Y' ELSE 'N' END)<> (TRGT.backlog_flag)
and SRC.cdctype='X'


