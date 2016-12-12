
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
homedepot_mdsdb.incident_final x  left join 
homedepot_mdwdb.d_internal_contact y on 
CONCAT('INTERNAL_CONTACT~',x.closed_by)=row_id  AND sourceinstance= source_id 
 JOIN   homedepot_mdwdb.f_incident B on x.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE  B.last_resolved_by_key <> CASE WHEN x.closed_by is null then 0 
WHEN (x.closed_by is not null and B.pivot_date is null) then -1 else y.row_key end)E; 