SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
 <<tenant>>_mdsdb.incident_final x  left outer join 
<<tenant>>_mdwdb.d_internal_contact y on 
CONCAT('INTERNAL_CONTACT~',x.resolved_by)=row_id  AND sourceinstance= source_id 
 JOIN   <<tenant>>_mdwdb.f_incident B on x.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE y.row_key<> B.last_resolved_by_key)E; 
