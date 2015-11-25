SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt
from pgi_mdsdb.change_request_final a

left join pgi_mdwdb.d_change_request b

on a.sys_id=b.row_id and

a.sourceinstance=b.source_id

where case when a.u_ra_q14 = 'Yes' then 'Y' when a.u_ra_q14 ='No' then 'N' end <>b.ra_q14_flag_c) a;