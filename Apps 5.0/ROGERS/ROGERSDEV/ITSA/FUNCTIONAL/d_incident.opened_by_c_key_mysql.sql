SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.opened_by_c_key' ELSE 'SUCCESS' END as Message
from 
(select count(1) as CNT from 
(select sys_id, caller_id, sourceinstance from rogersdev_mdsdb.incident_final) src left join 
rogersdev_mdwdb.d_incident trgt on src.sys_id =trgt.row_id and src.sourceinstance=trgt.source_id
left join rogersdev_mdwdb.d_internal_contact lkp on concat('INTERNAL_CONTACT~', src.caller_id)=lkp.row_id
where coalesce(lkp.row_key, case when  src.caller_id is null then 0 else -1 end)<>trgt.opened_by_c_key) temp;