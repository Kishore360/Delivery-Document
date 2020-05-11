select     CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_application.cio_name_c' ELSE 'SUCCESS' END as Message
from fidelity_mdsdb.cmdb_ci_appl_final app 
left join fidelity_mdwdb.d_application trg on trg.row_id=concat('APPLICATION~',app.sys_id)
left join fidelity_mdsdb.u_fmr_product_final prd on app.u_product=prd.sys_id
left join fidelity_mdsdb.cmn_cost_center_final pl on prd.cost_center=pl.sys_id
left join fidelity_mdsdb.u_fmr_cio_group_final pl1 on pl.u_cio_group=pl1.sys_id
left join fidelity_mdsdb.sys_user_final sys on pl1.u_cio=sys.sys_id
  where trg.cio_name_c<>coalesce(sys.name,'UNSPECIFIED') and app.cdctype<>'D'

;