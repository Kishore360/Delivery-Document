SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) cnt from #TABLE a
inner join #DWH_TABLE_SCHEMA.#LOOKUP1  b on a.sys_id collate utf8_unicode_ci=b.row_id  and b.row_key <100
left outer join #DWH_TABLE_SCHEMA.#LOOKUP2 c on a.u_trouble=c.dimension_code and dimension_class='TROUBLE~INCIDENT'
 where case when  a.u_trouble is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end <>b.trouble_c_key ) c;

