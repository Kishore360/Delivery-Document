SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code'
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message
from (select * FROM equifax_mdsdb.u_efx_application_final) SRC
JOIN (select * from equifax_mdwdb.d_efx_application_c where soft_deleted_flag = 'N') TRGT
ON (SRC.sys_id = TRGT.row_id
and  SRC.sourceinstance = TRGT.source_id)
WHERE case when u_documented_roles in ('Yes',1)  then 'Y' else 'N' end  <> TRGT.document_roles_c_flag;