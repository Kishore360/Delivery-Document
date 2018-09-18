SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.mf_online_inst_newcopy_met_src_c_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.change_request_final src
JOIN fidelity_mdwdb.d_change_request trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN fidelity_mdwdb.d_lov lkp
ON COALESCE(CONCAT('U_MF_ONLINE_INST_NEWCOPY_MET~CHANGE_REQUEST~',src.u_mf_online_inst_newcopy_met ),'UNSPECIFIED') =lkp.row_id 
and lkp.source_id=src.sourceinstance and lkp.dimension_class='U_MF_ONLINE_INST_NEWCOPY_MET~CHANGE_REQUEST'
where COALESCE(lkp.row_key,CASE WHEN src.u_mf_online_inst_newcopy_met  IS NULL THEN 0 else -1 end)<> trgt.mf_online_inst_newcopy_met_src_c_key
;

