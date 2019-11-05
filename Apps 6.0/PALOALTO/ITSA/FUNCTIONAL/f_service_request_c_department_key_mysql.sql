SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from paloalto_mdsdb.u_service_request_final s
left join paloalto_mdwdb.f_service_request_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join paloalto_mdwdb.d_internal_organization lkp
on lkp.row_id = ( concat('DEPARTMENT~',s.u_department )) 
AND lkp.source_id=s.sourceinstance
WHERE lkp.row_key <> t.department_key) temp;


'<a href="https://paloaltoservicedesk.service-now.com/nav_to.do?uri=u_service_request.do?sys_id=000058f94ff89b4051670ad14210c788" target="_blank">SREQ0067645</a>'

'<a href="https://panservicedesk.service-now.com/nav_to.do?uri=u_service_request.do?sys_id=000058f94ff89b4051670ad14210c788" target="_blank">SREQ0067645</a>'

'<a href="https://panservicedesk.service-now.com/nav_to.do?uri=u_service_request.do?sys_id=0af6bb8e4fa0df486dc4ecee0210c725" target="_blank">SREQ0066534</a>'
'<a href="https://panservicedesk.service-now.comu_service_request.do?sys_id=0af6bb8e4fa0df486dc4ecee0210c725" target="_blank">SREQ0066534</a>'

'<a href="https://panservicedesk.service-now.com/nav_to.do?uri=u_service_request.do?sys_id=0001930613d7d2000987b86f3244b0e3" target="_blank">SREQ0004047</a>'
'<a href="https://panservicedesk.service-now.com/nav_to.do?uri=u_service_request.do?sys_id=0001930613d7d2000987b86f3244b0e3" target="_blank">SREQ0004047</a>'