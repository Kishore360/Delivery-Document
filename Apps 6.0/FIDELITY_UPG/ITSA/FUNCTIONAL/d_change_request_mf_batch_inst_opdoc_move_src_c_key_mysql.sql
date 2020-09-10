SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.d_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join  fidelity_mdwdb.d_lov LKP
on COALESCE(CONCAT('MF_BATCH_INST_OPDOC_MOVE_C~CHANGE_REQUEST~', SRC.u_mf_batch_inst_opdoc_move), 'UNSPECIFIED') = LKP.row_id and
SRC.sourceinstance=LKP.source_id
 WHERE coalesce(LKP.row_key, case when SRC.u_mf_batch_inst_opdoc_move is null then 0 else -1 end )  <>(TRGT.mf_batch_inst_opdoc_move_src_c_key) and SRC.cdctype<>'D';
 
 

