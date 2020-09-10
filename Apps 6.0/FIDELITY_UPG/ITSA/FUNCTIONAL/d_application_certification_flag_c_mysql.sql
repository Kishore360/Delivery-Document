select     CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_application.product_name_c' ELSE 'SUCCESS' END as Message
from fidelity_mdsdb.cmdb_ci_appl_final app 
join fidelity_mdwdb.d_application trg on trg.row_id=concat('APPLICATION~',ifnull(app.sys_id,'')) and trg.source_id=app.sourceinstance
  where trg.certification_flag_c<>case when COALESCE(app.u_certification_flag,'UNSPECIFIED') = 1 then 'Y' else 'N' end and app.cdctype<>'D'
;