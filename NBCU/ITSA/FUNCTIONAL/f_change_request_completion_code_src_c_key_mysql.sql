
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from nbcu_mdsdb.change_request_final s
left  JOIN nbcu_mdwdb.f_change_request t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
left join nbcu_mdwdb.d_lov l
on concat('COMPLETION_CODE_C~CHANGE_REQUEST~~~',upper(s.u_completion_code))=l.row_id and s.sourceinstance=l.source_id
WHERE COALESCE(l.row_key,CASE WHEN s.u_completion_code IS NULL THEN 0 else -1 end)<> (t.completion_code_src_c_key)
 ) temp

