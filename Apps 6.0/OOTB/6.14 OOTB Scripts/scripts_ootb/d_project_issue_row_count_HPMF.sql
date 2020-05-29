SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project_issue.row_count' ELSE 'SUCCESS' END as Message
from (select * from 
(select count(*) count_src,SRC.sourceinstance 
from  (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_requests_final  where cdctype<>'D') SRC
inner join #MDS_TABLE_SCHEMA.hp_kcrt_fg_proj_issue_final SRC1
on SRC1.request_id=SRC.request_id
and SRC1.sourceinstance=SRC.sourceinstance
) count_src,
(select count(*) count_trgt,source_id 
from #DWH_TABLE_SCHEMA.d_project_issue TRGT where TRGT.soft_deleted_flag<>'Y' and row_key not in (-1,0))count_trgt

where count_src.count_src<>count_trgt.count_trgt
and count_src.sourceinstance=count_trgt.source_id

)SQ;