SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tivo_mdsdb.sc_req_item_final a
left join tivo_mdwdb.f_request c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left join tivo_mdwdb.d_lov b
on concat('STATE','~','SC_REQ_ITEM','~','~','~',upper(a.state))= b.src_rowid 
 AND a.sourceinstance= b.source_id  
 
where COALESCE(b.row_key,CASE WHEN a.state IS NULL THEN 0 else -1 end) <> c.state_src_key
) g