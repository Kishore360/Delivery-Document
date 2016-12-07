SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt
from pgi_mdsdb.u_external_incident_final a 
left join pgi_mdwdb.d_requires_review_c c on 
CONCAT('NAME~WHAT_REQUIRES_REVIEW~~~',SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(a.u_requires_review), ',', n.n), ',', -1))=c.row_id
and 

a.sourceinstance=c.source_id
inner join pgi_mdwdb.f_requires_review_c b  

on a.sys_id=b.row_id and 

a.sourceinstance=b.source_id

where requires_review_c_key<>coalesce(c.row_key,case when u_requires_review is null then 0 else -1 end) ) c


