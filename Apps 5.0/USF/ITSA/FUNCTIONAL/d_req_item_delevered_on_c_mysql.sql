 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from usf_mdwdb.d_request_item a left join
usf_mdwdb.d_request_item b
on a.row_id=b.row_id and a.source_id=b.source_id where  a.delevered_on_c <> b.delevered_on_c
)c