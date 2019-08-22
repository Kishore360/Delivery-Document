SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN count > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count from rogersdev_mdsdb.kb_knowledge_final src
join rogersdev_mdwdb.d_kb_knowledge_c trgt
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where src.number<>trgt.number)ma