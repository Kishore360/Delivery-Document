select 
case when cnt >0 then 'failure' else 'success' end as result, 
case when cnt >0 then 'mds to dwh data validation failed for d_kb_knowledge' else 'success' end as message
 from (
 select count(1) as cnt from pdchs_mdsdb.kb_knowledge_final src left join 
pdchs_mdwdb.d_kb_knowledge_c trgt on (src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id) 
where coalesce(src.number,'unspecified')<> trgt.number_c
)temp;

