 select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_configuration_item.cio_group_name_c' ELSE 'SUCCESS' END as Message
from fidelity_mdsdb.cmdb_ci_final f
 join fidelity_mdsdb.cmn_cost_center_final cc on f.cost_center=cc.sys_id and f.sourceinstance=cc.sourceinstance
 join fidelity_mdsdb.u_fmr_business_unit_final bu on cc.u_business_unit=bu.sys_id and bu.sourceinstance=cc.sourceinstance
 join fidelity_mdsdb.u_fmr_business_groups_final bg on cc.u_business_group=bg.sys_id and bg.sourceinstance=cc.sourceinstance
 join fidelity_mdsdb.u_fmr_operating_committee_final op on 
cc.u_ocm=op.sys_id and op.sourceinstance=cc.sourceinstance
join fidelity_mdsdb.u_fmr_cio_group_final cio 
on cio.sys_id=cc.u_cio_group and cio.sourceinstance=cc.sourceinstance
join fidelity_mdwdb.d_configuration_item trg on trg.row_id=f.sys_id and f.sourceinstance=trg.source_id
where trg.business_groups_code_c   <>coalesce(bg.u_business_group ,'UNSPECIFIED')  and f.cdctype='X'
 and cc.cdctype='X' and bg.cdctype='X' and cio.cdctype='X'