SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed ' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype <> 'D') SRC
inner join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join  #DWH_TABLE_SCHEMA.f_demand TRGT
on SRC.REQUEST_ID=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.company_key<>0;