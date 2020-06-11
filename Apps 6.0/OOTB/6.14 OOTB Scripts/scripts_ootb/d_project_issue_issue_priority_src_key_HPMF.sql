SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project_issue.issue_priority_src_key' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_requests_final  where cdctype<>'D') SRC
inner join #MDS_TABLE_SCHEMA.hp_kcrt_fg_proj_issue_final SRC1
on SRC1.request_id=SRC.request_id
and SRC1.sourceinstance=SRC.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_project_issue TRGT
on SRC.request_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_lov lov
on lov.row_id=coalesce(concat('PROJECT_ISSUE~PRIORITY~',SRC.priority_code),'UNSPECIFIED')
and lov.source_id=SRC.sourceinstance
where coalesce(lov.row_key,case when SRC.priority_code is null then 0 else -1 end)<>coalesce(TRGT.issue_priority_src_key,'');