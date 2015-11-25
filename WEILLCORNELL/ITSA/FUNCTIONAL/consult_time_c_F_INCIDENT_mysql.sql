 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt
from #TABLE s
inner join #DWH_TABLE_SCHEMA.#LOOKUP1 i on s.sys_id collate utf8_unicode_ci=i.row_id  and i.row_key <100
and s.sourceinstance=i.source_id
where coalesce(timestampdiff(second,'1970-01-01 00:00:00',s.u_consult_time),'0') <>i.consult_time_c) c;
