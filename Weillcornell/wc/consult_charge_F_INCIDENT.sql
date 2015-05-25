SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt from #TABLE a
inner join #DWH_TABLE_SCHEMA.#LOOKUP1  b on a.sys_id collate utf8_unicode_ci=b.row_id  and b.row_key <100
where a.u_consult_charge<>b.consult_charge_c ) c;
