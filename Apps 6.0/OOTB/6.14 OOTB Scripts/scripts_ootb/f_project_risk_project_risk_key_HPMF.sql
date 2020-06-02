SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_project_risk.project_risk_key' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_requests_final  where cdctype<>'D') SRC
inner join #MDS_TABLE_SCHEMA.hp_kcrt_fg_proj_risk_final SRC1
on SRC1.request_id=SRC.request_id
and SRC1.sourceinstance=SRC.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_knta_references_final SRC2
on SRC.request_id=SRC2.source_id
and SRC.sourceinstance=SRC2.sourceinstance
left join  #DWH_TABLE_SCHEMA.f_project_risk TRGT
on concat(coalesce(SRC2.PARAMETER1,'UNSPECIFIED'),'~',coalesce(SRC.request_id,'UNSPECIFIED'))=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_project_risk lov
on lov.row_id=coalesce(SRC.request_id,'UNSPECIFIED')
and lov.source_id=SRC.sourceinstance
where coalesce(lov.row_key,case when SRC.request_id is null then 0 else -1 end)<>coalesce(TRGT.project_risk_key,'');