SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt
FROM asu_mdsdb.kb_knowledge_final A
left join  asu_mdwdb.f_kb_knowledge_c B on A.sourceinstance=B.source_id 
AND B.ROW_ID=A.SYS_ID
left join  asu_mdwdb.d_kb_knowledge_c C
on A.sourceinstance=C.source_id 
AND C.ROW_ID=A.SYS_ID
 
WHERE COALESCE(C.row_key,CASE WHEN A.SYS_ID IS NULL THEN 0 else -1 end)<>(B.d_kb_knowledge_c_key))X