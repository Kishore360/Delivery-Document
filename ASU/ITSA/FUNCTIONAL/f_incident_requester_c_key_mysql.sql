
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from asu_mdsdb.incident_final a
 left join asu_mdwdb.d_internal_contact b on
concat('INTERNAL_CONTACT~',a.u_requester)=b.row_id 
and a.sourceinstance = b.source_id
left join asu_mdwdb.f_incident c on a.sourceinstance=c.source_id and a.sys_id=c.row_id
where b.row_key<>c.requester_c_key

)i; 
