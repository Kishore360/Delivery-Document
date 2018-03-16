SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan_mdsdb.u_service_request_final s
left join pan_mdwdb.f_service_request_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN pan_mdwdb.d_lov l  
ON COALESCE(CONCAT('CONTACT_TYPE~SERVICE_REQUEST','~','','~','','~',s.contact_type),'UNSPECIFIED')= l.row_id 
and l.source_id=s.sourceinstance
WHERE t.reported_type_src_key<>coalesce( l.row_key,case when contact_type is null then 0 else -1 end )) temp


