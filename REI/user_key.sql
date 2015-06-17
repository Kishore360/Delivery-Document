SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(1) as cnt FROM rei_mdwdb.f_time_entry fi join rei_mdsdb.time_card_final a 
on (substring(fi.row_id,1,32) =a.sys_id) 
JOIN rei_mdwdb.d_internal_contact b ON substring(b.row_id,18,32)=a.user and b.source_id=a.sourceinstance
and fi.user_key<>b.row_key and fi.row_key <1000) c;