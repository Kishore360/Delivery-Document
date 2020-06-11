SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_lov_status_issue.lower_range_value' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_statuses_nls_final  where cdctype<>'D') SRC
inner join 
(select  
SRC2.status_id as row_id,
SRC2.sourceinstance as sourceinstance,
SRC1.cdctype
from #MDS_TABLE_SCHEMA.hp_kcrt_request_types_nls_final SRC1
inner join #MDS_TABLE_SCHEMA.hp_kcrt_request_type_statuses_final SRC2
on SRC1.request_type_id=SRC2.request_type_id
and SRC1.sourceinstance=SRC2.sourceinstance
where SRC1.reference_code='_PROJECT_ISSUE')temp
on SRC.status_id=temp.row_id
and SRC.sourceinstance=temp.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_lov TRGT
on concat('PROJECT_ISSUE~STATUS~',SRC.STATUS_ID)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(TRGT.lower_range_value,'')<>null;