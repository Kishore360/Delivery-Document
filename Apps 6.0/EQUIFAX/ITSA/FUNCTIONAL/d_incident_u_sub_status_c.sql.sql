SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.u_sub_status_c' ELSE 'SUCCESS' END as Message 

from

(select count(1) as cnt from(select sys_id, sourceinstance,u_sub_status from equifax_mdsdb.incident_final where CDCTYPE<>'D') src
 left join  equifax_mdwdb.d_incident trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where coalesce(u_sub_status,'UNSPECIFIED')  <>trgt.u_sub_status_c and src.cdctype<>'D'
) temp