 select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_configuration_item.cio_group_name_c' ELSE 'SUCCESS' END as Message
from fidelity_mdsdb.cmdb_ci_final f
join fidelity_mdsdb.cmn_cost_center_final cc on f.cost_center=cc.sys_id
join fidelity_mdsdb.u_fmr_business_unit_final bu on cc.u_business_unit=bu.sys_id
join fidelity_mdsdb.u_fmr_business_groups_final bg on bu.u_business_group=bg.sys_id
join fidelity_mdsdb.u_fmr_operating_committee_final op on op.sys_id=bg.u_ocm
join fidelity_mdsdb.u_fmr_cio_group_final cio on cio.sys_id=op.u_cio_group
left join fidelity_mdwdb.d_configuration_item trg on trg.row_id=f.sys_id
 where trg.cio_group_name_c<>coalesce(cio.u_cio_group_name ,'UNSPECIFIED');