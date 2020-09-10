 select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_configuration_item.division_description_c' ELSE 'SUCCESS' END as Message
 from fidelity_mdsdb.cmdb_ci_final f
join fidelity_mdsdb.cmn_cost_center_final cc on f.cost_center=cc.sys_id
join fidelity_mdsdb.u_fmr_division_final bu on cc.u_division=bu.sys_id
left join fidelity_mdwdb.d_configuration_item trg on trg.row_id=f.sys_id
 where trg.division_description_c<>coalesce(bu.u_division_description,'UNSPECIFIED')