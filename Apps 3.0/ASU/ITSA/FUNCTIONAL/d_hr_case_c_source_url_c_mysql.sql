SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from 
asu_mdwdb.d_hr_case_c a
LEFT JOIN asu_mdsdb.hr_case_final h ON a.row_id=h.sys_id
AND a.source_id=h.sourceinstance
where  a.source_url_c<>CONCAT('<a href=\"','https://asu.service-now.com/navpage.do/','hr_case.do?sys_id=',h.sys_id,'\" target=\"_blank\">',h.number,'</a>');

