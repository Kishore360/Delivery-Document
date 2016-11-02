SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message FROM (
select count(1) as cnt 
from pgi_mdsdb.u_external_incident_final b 
JOIN  pgi_mdwdb.d_incident a ON (a.row_id=b.sys_id AND a.source_id=b.sourceinstance)
left join (select documentkey as row_id,2 as source_id from pgi_mdsdb.sys_audit_final  FORCE INDEX (ix_newvalue) WHERE  tablename = 'u_external_incident' and fieldname='state' AND newvalue='5' UNION 
select documentkey as row_id,2 as source_id from pgi_mdsdb.sys_audit_final  FORCE INDEX (ix_oldvalue) WHERE  tablename = 'u_external_incident' and fieldname='state' AND oldvalue='5' UNION 
select documentkey as row_id,2 as source_id from pgi_mdsdb.sys_audit_final  FORCE INDEX (ix_oldvalue) WHERE  tablename = 'u_external_incident' and fieldname='u_support_tier_type') c 
on (a.row_id=c.row_id AND a.source_id=c.source_id)
 where case WHEN u_ticket_initiated_from<>'Web Ticket' AND u_service_restored = 1 
AND timestampdiff(minute,sys_created_on,u_restored)<30 THEN 'Y' 
WHEN u_ticket_initiated_from='Web Ticket' AND  c.row_id IS NULL AND b.u_service_level='P'
 AND timestampdiff(minute,sys_created_on,u_restored)<120 THEN 'Y' 
WHEN u_ticket_initiated_from='Web Ticket' AND  c.row_id IS NULL 
AND b.u_service_level<>'P' AND timestampdiff(minute,sys_created_on,u_restored)<1440 THEN 'Y' 
ELSE 'N' END <> a.first_call_restoration_flag_c )d
