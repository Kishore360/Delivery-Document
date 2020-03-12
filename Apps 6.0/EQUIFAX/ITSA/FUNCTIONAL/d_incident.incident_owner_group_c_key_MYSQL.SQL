SELECT 

CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.incident_owner_group_c_key' ELSE 'SUCCESS' END as Message

from

(select COUNT(1) AS CNT 
from (select sys_id,sourceinstance,u_owner_group,CDCTYPE from equifax_mdsdb.incident_final where CDCTYPE<>'D') SRC

left join equifax_mdwdb.d_incident TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id

left join equifax_mdwdb.d_internal_organization lkp on coalesce(concat('GROUP~', SRC.u_owner_group),'UNSPECIFIED')=lkp.row_id AND SRC.sourceinstance= lkp.source_id
 where  
coalesce(lkp.row_key, case when SRC.u_owner_group is null then 0 else -1 end)<>TRGT.incident_owner_group_c_key and SRC.cdctype<>'D'

) temp; 