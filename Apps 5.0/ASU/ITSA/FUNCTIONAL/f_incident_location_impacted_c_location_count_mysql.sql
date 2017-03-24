
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from (select count(1) as loc_cnt,sys_id,sourceinstance from asu_mdsdb.incident_final
group by sys_id
) s
left join asu_mdwdb.f_incident_location_impacted_c t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
WHERE t.location_count <> coalesce(s.loc_cnt,0) ) temp


