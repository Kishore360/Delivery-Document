 select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_internal_organization.division_description_c' ELSE 'SUCCESS' END as Message
from fidelity_mdsdb.sys_user_group_final f
join fidelity_mdsdb.cmn_cost_center_final cc on f.cost_center=cc.sys_id
join fidelity_mdsdb.u_fmr_business_unit_final bu on cc.u_business_unit=bu.sys_id
join fidelity_mdsdb.u_fmr_business_groups_final bg on cc.u_business_group=bg.sys_id
join fidelity_mdsdb.u_fmr_operating_committee_final op on op.sys_id=cc.u_ocm
join fidelity_mdsdb.u_fmr_cio_group_final cio on cio.sys_id=cc.u_cio_group
join fidelity_mdsdb.sys_user_final sys on cio.u_cio=sys.sys_id
join fidelity_mdwdb.d_internal_organization trg on trg.row_id=concat('GROUP~',f.sys_id)
 where trg.cio_name_c<>coalesce(sys.name,'UNSPECIFIED') and f.cdctype='X'
 and cc.cdctype='X' and bg.cdctype='X' and cio.cdctype='X';