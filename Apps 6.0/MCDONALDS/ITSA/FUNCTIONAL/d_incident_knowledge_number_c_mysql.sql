
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_incident.knowledge_number_c' ELSE 'SUCCESS' END as MESSAGE
FROM 
(
SELECT count(1) as cnt
FROM  mcd_mdwdb.d_incident inc
right join 
(SELECT a.task , a.kb_knowledge,a.sys_created_on from mcd_mdsdb.m2m_kb_task_final a
 join
(SELECT task  , min(sys_created_on) as sys_created_on from mcd_mdsdb.m2m_kb_task_final
group by 1) min 
on a.task = min.task where  a.sys_created_on = min.sys_created_on )m2m on m2m.task = inc.row_id
right join mcd_mdsdb.kb_knowledge_final  kb
on m2m.kb_knowledge = kb.sys_id
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance)
where (kb.cdctime<=f1.lastupdated) and COALESCE(kb.number,'UNSPECIFIED')<>inc.knowledge_number_c
)a;