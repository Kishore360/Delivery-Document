SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'MDS TO MDW DATA VALIDATION FAILED'
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt
from pan6_mdwdb.f_change_request a
inner join pan6_mdsdb.change_request_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
where a.notification_group_count_c<>LENGTH(`u_notified_groups`) - LENGTH(REPLACE(`u_notified_groups`, ',', ''))+1)temp
 