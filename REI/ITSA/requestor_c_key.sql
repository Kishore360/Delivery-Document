SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt
from rei_mdwdb.d_project a  join
rei_mdsdb.pm_project_final c on a.row_id=c.sys_id and a.source_id=c.sourceinstance
 join rei_mdwdb.d_internal_contact b 
ON b.row_id = COALESCE(CONCAT('INTERNAL_CONTACT~',c.u_requestor),'UNSPECIFIED')
AND  b.source_id=a.source_id
AND a.changed_on BETWEEN b.effective_from AND b.effective_to
and a.requestor_c_key <> b.row_key )c