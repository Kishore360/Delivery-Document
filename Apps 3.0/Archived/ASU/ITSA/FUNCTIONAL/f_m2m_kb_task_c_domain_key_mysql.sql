SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt  from asu_mdwdb.f_kb_knowledge_c kn inner join asu_mdwdb.f_m2m_kb_task_c m2m

on m2m.d_kb_knowledge_c_key=kn.d_kb_knowledge_c_key

where m2m.domain_key<>kn.domain_key)x
