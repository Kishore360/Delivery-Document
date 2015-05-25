SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select COUNT(*) AS cnt
from (
select s.sys_id, s.u_sox_compliance,i.row_id, i.sox_compliance_flag_c,
case when s.u_sox_compliance = '1' then 'Y' when s.u_sox_compliance ='0' then 'N' else null end as soxflag 
from rambus_mdsdb.change_request_final s
inner join rambus_workdb.dwh_d_change_request i on s.sys_id collate utf8_unicode_ci=i.row_id and 
s.sourceinstance = i.source_id 
)A where  coalesce(sox_compliance_flag_c,' ')<>coalesce(soxflag,' ')


) c;