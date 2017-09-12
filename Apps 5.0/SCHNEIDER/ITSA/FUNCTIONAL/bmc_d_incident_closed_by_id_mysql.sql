SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.close_code_src_key' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT ON (SRC.incident_number = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.sourceinstance = TRGT.source_id ) 
left join (select documentkey,sourceinstance,max(sys_updated_by) as closed_by
from schneider_workdb.hpd_help_desk_sys_audit where tablename = 'hpd_help_desk' and fieldname = 'Status' and newvalue = 'Closed' and (documentkey, sourceinstance, sys_created_on) in 
(select documentkey, sourceinstance, max(sys_created_on) as latest_date
from schneider_workdb.hpd_help_desk_sys_audit where tablename = 'hpd_help_desk' and fieldname = 'Status' and newvalue = 'Closed' group by documentkey, sourceinstance)
group by documentkey,sourceinstance) sys_audit on TRGT.row_id = sys_audit.documentkey and TRGT.source_id = sys_audit.sourceinstance 
WHERE TRGT.closed_by_id <> sys_audit.closed_by;
