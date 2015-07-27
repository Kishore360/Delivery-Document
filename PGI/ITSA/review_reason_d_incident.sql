SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from pgi_mdsdb.u_what_requires_review_final a
inner join  pgi_mdsdb.incident_final b on a.sys_id = b.u_requires_review
inner join pgi_mdwdb.d_incident c on b.sys_id= c.row_id
where
c.review_reason  <> coalesce(a.u_name,'UNSPECIFIED'))c