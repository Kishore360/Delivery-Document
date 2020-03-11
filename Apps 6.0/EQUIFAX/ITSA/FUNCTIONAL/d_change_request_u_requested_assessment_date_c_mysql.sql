SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
from
equifax_mdsdb.change_request_final a
join
equifax_mdwdb.d_change_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where CONVERT_TZ(a.u_requested_assessment_date,'GMT','America/New_York')<>u_requested_assessment_date_c and a.cdctype<>'D')b