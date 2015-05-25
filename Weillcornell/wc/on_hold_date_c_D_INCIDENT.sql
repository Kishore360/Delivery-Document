
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt from #TABLE s
inner join #DWH_TABLE_SCHEMA.#LOOKUP1 i on s.sys_id collate utf8_unicode_ci=i.row_id and s.sourceinstance = i.source_id and i.row_key <100
where CONVERT_TZ(coalesce(u_on_hold_date,' '),'GMT','America/New_York') <>coalesce(i.on_hold_date_c,' ')
 ) c;
 