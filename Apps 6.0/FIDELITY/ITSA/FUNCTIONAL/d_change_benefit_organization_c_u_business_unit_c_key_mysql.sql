select     CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_application.product_name_c' ELSE 'SUCCESS' END as Message
from fidelity_mdsdb.u_change_benefit_organization_final app 
join fidelity_mdwdb.d_change_benefit_organization_c trg on trg.row_id=app.sys_id and trg.source_id=app.sourceinstance
  where trg.u_business_unit_c_key<>  COALESCE(app.u_business_unit, 'UNSPECIFIED') and app.cdctype<>'D'
;