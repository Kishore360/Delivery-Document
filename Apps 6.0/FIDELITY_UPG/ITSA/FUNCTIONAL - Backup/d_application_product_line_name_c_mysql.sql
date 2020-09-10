select     CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_application.product_line_name_c' ELSE 'SUCCESS' END as Message
from fidelity_mdsdb.cmdb_ci_appl_final app 
left join fidelity_mdwdb.d_application trg on trg.row_id=concat('APPLICATION~',app.sys_id)
left join fidelity_mdsdb.u_fmr_product_final prd on app.u_product=prd.sys_id
left join fidelity_mdsdb.sys_user_final sys on prd.u_service_offering_manager=sys.sys_id
left join fidelity_mdsdb.u_fmr_product_line_final pl on prd.u_product_line_identifier=pl.sys_id
  where trg.product_line_name_c<>coalesce(pl.name,'UNSPECIFIED') and app.cdctype<>'D'

;