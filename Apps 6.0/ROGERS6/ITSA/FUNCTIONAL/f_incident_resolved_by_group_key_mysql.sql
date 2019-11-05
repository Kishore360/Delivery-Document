SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN count > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count from rogers6_mdsdb.question_final src
join rogers6_mdwdb.d_question_c trgt
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where if(src.active=1,'Y','N') <>trgt.active_flag
and src.cdctype='X' 
)ma
