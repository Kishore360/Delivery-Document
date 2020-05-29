SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_cluster.linked_kb_articles' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.incident_final SRC
left join (select source,count(1) as count_kb from #MDS_TABLE_SCHEMA.kb_knowledge_final
group by source) kb
on kb.source = SRC.sys_id
left join #DWH_TABLE_SCHEMA.f_incident_cluster TRGT
on TRGT.row_id = SRC.sys_id 
and TRGT.source_id = SRC.sourceinstance
where coalesce(count_kb,0)<>coalesce(TRGT.linked_kb_articles,'')