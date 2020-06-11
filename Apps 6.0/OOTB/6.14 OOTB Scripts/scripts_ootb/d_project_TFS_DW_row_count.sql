select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row count failed for d_project' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.d_project TRGT where TRGT.row_key not in (0,-1) and TRGT.source_id = 11
) A, 
(select count(*) count_2 FROM #MDS_TABLE_SCHEMA.dimteamproject_final SRC) B
where count_1 <> count_2) SQ;