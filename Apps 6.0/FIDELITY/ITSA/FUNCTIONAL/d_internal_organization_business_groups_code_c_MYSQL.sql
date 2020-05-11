 select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_internal_organization.business_groups_code_c' ELSE 'SUCCESS' END as Message
 from fidelity_mdsdb.sys_user_group_final f
join fidelity_mdsdb.cmn_cost_center_final cc on f.cost_center=cc.sys_id
join fidelity_mdsdb.u_fmr_business_unit_final bu on cc.u_business_unit=bu.sys_id
join fidelity_mdsdb.u_fmr_business_groups_final bg on bu.u_business_group=bg.sys_id
left join fidelity_mdwdb.d_internal_organization trg on trg.row_id=concat('GROUP~',f.sys_id)
 where trg.business_groups_code_c<>coalesce(bg.u_business_group ,'UNSPECIFIED');