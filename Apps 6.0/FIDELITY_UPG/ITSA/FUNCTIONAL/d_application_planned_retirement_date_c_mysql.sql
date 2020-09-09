select     CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_application.product_name_c' ELSE 'SUCCESS' END as Message
from fidelity_mdsdb.cmdb_ci_appl_final app 
join fidelity_mdwdb.d_application trg on trg.row_id=concat('APPLICATION~',ifnull(app.sys_id,'')) and trg.source_id=app.sourceinstance
  where trg.planned_retirement_date_c<>CONVERT_TZ(app.u_planned_retirement_date, 'UTC', 'America/New_York') and app.cdctype<>'D'
;