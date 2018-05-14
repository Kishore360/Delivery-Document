SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from pan_mdsdb.incident_final a
 left join pan_mdwdb.d_lov b on 
COALESCE(CONCAT('CATEGORY~INCIDENT','~','~','~',UPPER(a.u_category)),'UNSPECIFIED')=b.src_rowid
left join pan_mdwdb.d_incident c on a.sourceinstance=c.source_id and a.sys_id=c.row_id
where COALESCE(b.row_key,case when a.u_category is null then 0 else -1 end)<>c.category_src_key
)i; 
