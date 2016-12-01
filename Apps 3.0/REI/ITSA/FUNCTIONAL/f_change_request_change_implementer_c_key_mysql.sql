SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.change_request_final a
JOIN rei_mdwdb.f_change_request b
on a.sourceinstance=b.source_id
and a.sys_id = b.row_id 
join
rei_mdwdb.d_internal_contact c
on COALESCE(CONCAT('INTERNAL_CONTACT~',a.u_change_implementer),'UNSPECIFIED') = c.row_id and b.source_id=c.source_id
AND b.pivot_date
 BETWEEN c.effective_from AND c.effective_to
where coalesce(c.row_key,case when a.u_change_implementer is null then 0 else -1 end )  <>b.change_implementer_c_key
)a;