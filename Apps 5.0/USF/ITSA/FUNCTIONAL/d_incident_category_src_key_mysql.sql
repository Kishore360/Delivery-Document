SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  usf_mdsdb.incident_final s
left  JOIN usf_mdwdb.d_incident t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id  
join usf_mdwdb.d_lov l
on COALESCE(CONCAT('CATEGORY','~','INCIDENT','~','~','~',UPPER(s.u_csi_category)),'UNSPECIFIED')= l.row_id
WHERE COALESCE(l.row_key,CASE WHEN s.u_csi_category IS NULL THEN 0 else '-1' end)<>
 t.category_src_key
) temp