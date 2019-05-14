SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from rambus_mdsdb.incident_final s
left join rambus_mdwdb.f_incident t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
LEFT JOIN rambus_mdwdb.d_internal_organization l 
 ON ( COALESCE(CONCAT('GROUP','~',s.ASSIGNMENT_GROUP),'UNPSECIFIED')= l.row_id AND s.sourceinstance= l.source_id )
WHERE 

DATE_FORMAT(t.pivot_date, '%Y-%m-%d %H:%i:%s')
AND (t.pivot_date BETWEEN l.effective_from AND l.effective_to) and

COALESCE(l.row_key,CASE WHEN s.assignment_group IS NULL THEN 0 else '-1' end)<> COALESCE(t.assignment_group_key,'')
) temp




