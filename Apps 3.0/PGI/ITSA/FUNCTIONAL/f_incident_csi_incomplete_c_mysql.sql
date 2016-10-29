SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt
from pgi_mdsdb.u_external_incident_final a 
inner join pgi_mdwdb.f_incident b  
on a.sys_id=b.row_id and 
a.sourceinstance=b.source_id 
WHERE   ( case when a.u_flag_for_review = 1 and a.u_csi_complete=0 then 1 else 0 END ) <> b.csi_incomplete_c  )c