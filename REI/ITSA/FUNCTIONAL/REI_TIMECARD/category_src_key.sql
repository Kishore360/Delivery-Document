SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from rei_mdwdb.f_time_entry fi JOIN rei_mdsdb.time_card_final  f ON (substring(fi.row_id,1,32) =f.sys_id) 
join rei_mdwdb.d_lov l on l.row_id=COALESCE( CONCAT('CATEGORY','~','TIME_CARD','~','~','~',upper(f.category )),'UNSPECIFIED')
and fi.category_src_key <> l.row_key and fi.row_key < 10000)c