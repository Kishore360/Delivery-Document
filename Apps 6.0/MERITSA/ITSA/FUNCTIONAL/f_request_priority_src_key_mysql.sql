
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from mercury_mdsdb.sc_request_final a 
left join mercury_mdwdb.f_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id and a.cdctype<>'D'
left join mercury_mdwdb.d_lov c
on c.row_id=COALESCE(CONCAT('PRIORITY','~','SC_REQUEST','~',UPPER(a.priority)),'UNSPECIFIED') and a.sourceinstance=c.source_id
where  COALESCE(c.row_key,CASE WHEN a.priority IS NULL THEN 0 else '-1' end) <> b.priority_src_key
) g


