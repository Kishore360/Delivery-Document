SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(*) as cnt 
from mercuryins_mdsdb.sys_user_final b 
join mercuryins_mdwdb.d_internal_contact a 
ON a.row_id = CONCAT('INTERNAL_CONTACT~',b.sys_id) AND a.source_id = b.sourceinstance
join mercuryins_mdwdb.d_location LKP
on COALESCE(b.location,'UNSPECIFIED')= LKP.row_id and LKP.source_id= b.sourceinstance
where COALESCE( LKP.row_key,case when b.location  is null then 0 else -1 end) <> a.location_key)c ;