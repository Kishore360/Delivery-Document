SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  usf_mdsdb.incident_final s
left  JOIN usf_mdwdb.d_incident t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id
join
usf_mdsdb.u_csi_category_final lkp
ON s.u_csi_item_ref=lkp.sys_id
WHERE lkp.u_name<>
 t.csi_item_ref_c
) temp