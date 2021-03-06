

SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_incident.knowledge_used_c_flag' ELSE 'SUCCESS' END as MESSAGE
FROM 
(
SELECT count(1) as cnt
FROM  mcdonalds_mdwdb.d_incident inc
left join 
(SELECT a.task ,a.cdctype, a.kb_knowledge,a.sys_created_on from mcdonalds_mdsdb.m2m_kb_task_final a
 join
(SELECT task  , min(sys_created_on) as sys_created_on from mcdonalds_mdsdb.m2m_kb_task_final
group by 1) min 
on a.task = min.task and a.sourceinstance=min.sourceinstance 
where a.sys_created_on = min.sys_created_on )m2m on m2m.task = inc.row_id
left join mcdonalds_mdsdb.kb_knowledge_final  kb
on m2m.kb_knowledge = kb.sys_id and m2m.sourceinstance=kb.sourceinstance and kb.cdctype<>'D'
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance)
where (kb.cdctime<=f1.lastupdated) and  CASE WHEN kb.number is NULL THEN 'N' ELSE 'Y' END<>
inc.knowledge_used_c_flag
)a;