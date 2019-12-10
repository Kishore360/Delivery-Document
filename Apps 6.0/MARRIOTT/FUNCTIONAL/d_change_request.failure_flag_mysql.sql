SELECT CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_change_request.failure_flag' ELSE 'SUCCESS' END as Message
from marriott_mdwdb.d_change_request t
LEFT OUTER JOIN marriott_mdsdb.change_request_final a on t.row_id=a.sys_id and t.source_id=a.sourceinstance
LEFT OUTER JOIN (select b.priority,b.u_enterprise_reportable,b.u_major_incident,b.caused_by from marriott_mdsdb.incident_final b where ((b.priority in( 1,2) and b.u_enterprise_reportable=1) OR
(b.u_major_incident=1 ))) b ON a.sys_id=b.caused_by
LEFT OUTER JOIN marriott_mdsdb.sys_choice_final c ON a.close_code=c.value
and c.name='change_request' and c.element='close_code' and c.language='en'
LEFT JOIN marriott_mdsdb.sys_choice_final d on a.state=d.value
and d.name='change_request' and d.element='state' and d.language='en' 
WHERE a.cdctype<>'D' and t.failure_flag <> (case when ((b.priority in( 1,2) and b.u_enterprise_reportable=1) OR
(b.u_major_incident=1 )) OR a.u_p1_or_p2_incident is not null OR c.label in ('Unsuccessful - Backed out','Unsuccessful')
then 'Y' when d.label in ('Draft', 'Scheduled', 'Review', 'Plan', 'Approval','Implement','Cancelled') then 'X' else 'N' end)