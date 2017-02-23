SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from (
select count(1) as cnt from <<tenant>>_mdsdb.incident_final x  
left outer join <<tenant>>_mdwdb.d_internal_contact y on 
CONCAT('INTERNAL_CONTACT~',x.resolved_by)=y.row_id  AND sourceinstance= source_id 
 JOIN   <<tenant>>_mdwdb.f_incident B on B.ROW_ID=SYS_ID and x.sourceinstance=B.source_id  
WHERE last_resolved_by_key<> coalesce(y.row_key,case when resolved_by is null then 0 else -1 end )
)E; 
