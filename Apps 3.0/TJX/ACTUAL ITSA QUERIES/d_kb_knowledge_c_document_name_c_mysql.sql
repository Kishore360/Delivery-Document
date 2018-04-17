SELECT 
CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result,
CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from tjx_mdwdb.d_kb_knowledge_c b
inner  JOIN  tjx_mdsdb.kb_knowledge_final a
on  b.ROW_ID=SYS_ID and sourceinstance=b.source_id
where a.u_document_name <> b.document_name_c)c
