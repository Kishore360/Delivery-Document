select case when count(1)>0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)>0 then 'MDS to DWH data validation failed for kb_knowledge.sys_view_count' else 'SUCCESS' end as Message
from pdchs_mdsdb.kb_knowledge_final as src
join pdchs_mdwdb.f_kb_knowledge_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id where 
src.sys_view_count<> trgt.view_count_metric_c and src.CDCTYPE<>'D';