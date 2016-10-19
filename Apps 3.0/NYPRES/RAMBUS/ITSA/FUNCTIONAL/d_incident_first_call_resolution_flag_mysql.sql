SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
from (select  count(1) as cnt from rambus_mdwdb.d_incident  a
left join
(

select d_inc.row_id,d_inc.source_id,'Y' as first_call_resolution_flag  from rambus_mdwdb.d_incident  d_inc
left join(select documentkey,sourceinstance,newvalue,oldvalue from  rambus_mdsdb.sys_audit_final where tablename='incident' 
and fieldname='assignment_group' and newvalue<>oldvalue group by 1,2) c on c.documentkey=d_inc.row_id and c.sourceinstance=d_inc.source_id
WHERE d_inc.opened_on >= d_inc.last_resolved_on - INTERVAL 1 HOUR
  AND c.documentkey IS NULL
  AND if(DAYNAME(d_inc.opened_on) = 'saturday',0, if(DAYNAME(d_inc.opened_on) = 'sunday'
    AND cast(d_inc.opened_on AS time) < '18:00:00',0, if(DAYNAME(d_inc.last_resolved_on) = 'friday'
    AND cast(d_inc.last_resolved_on AS time) > '18:00:00',0,1))) limit 1000000)b on a.row_id=b.row_id 
and a.source_id=b.source_id
where a.first_call_resolution_flag<>coalesce(b.first_call_resolution_flag,'N')) a;