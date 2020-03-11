SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.u_sla' ELSE 'SUCCESS' END as Message 

from

(select count(1) as cnt from(select sys_id, sourceinstance,u_sla from equifax_mdsdb.incident_final where CDCTYPE<>'D') src
left join  equifax_mdwdb.d_incident trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id 
where (CASE when u_sla=0 then 'N' else 'Y' END)  <>trgt.u_sla_c  and src.cdctype<>'D'
) temp;