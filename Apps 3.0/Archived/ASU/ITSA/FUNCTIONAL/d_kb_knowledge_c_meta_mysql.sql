SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt
FROM asu_mdsdb.kb_knowledge_final A
left join  asu_mdwdb.d_kb_knowledge_c B on A.sourceinstance=B.source_id 
AND B.ROW_ID=SYS_ID
WHERE A.meta <> B.meta)A