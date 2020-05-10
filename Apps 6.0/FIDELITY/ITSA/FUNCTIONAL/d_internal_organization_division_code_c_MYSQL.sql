 select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_internal_organization.division_code_c' ELSE 'SUCCESS' END as Message
 from fidelity_mdsdb.sys_user_group_final f
join fidelity_mdsdb.cmn_cost_center_final cc on f.cost_center=cc.sys_id
join fidelity_mdsdb.u_fmr_division_final bu on cc.u_division=bu.sys_id
left join fidelity_mdwdb.d_internal_organization trg on trg.row_id=concat('GROUP~',f.sys_id)
 where trg.division_code_c<>coalesce(bu.u_division,'UNSPECIFIED');