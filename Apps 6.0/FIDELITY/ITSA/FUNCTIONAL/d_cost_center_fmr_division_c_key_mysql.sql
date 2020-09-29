SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.cmn_cost_center_final  SRC 
JOIN fidelity_mdwdb.d_cost_center TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join fidelity_mdwdb.d_fmr_division_c LKP
on COALESCE(SRC.u_division, 'UNSPECIFIED') = LKP.row_id and SRC.sourceinstance=LKP.source_id
 WHERE  coalesce(LKP.row_key, case when SRC.u_division is null then 0 else -1 end )<>(TRGT.fmr_division_c_key) and SRC.cdctype<>'D';
 
 

