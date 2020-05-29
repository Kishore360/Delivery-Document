SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.demand_project_status_src_key' ELSE 'SUCCESS' END as Message
from (select * from    #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype<>'D') SRC
left join(select * from   #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join   #DWH_TABLE_SCHEMA.d_demand TRGT
on SRC.request_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)project
on SRC1.prop_project_id=project.prj_project_id
and SRC1.sourceinstance=project.sourceinstance
left join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_requests_final)request
on project.request_id=request.request_id
and project.sourceinstance=request.sourceinstance
left join (select * from   #DWH_TABLE_SCHEMA.d_lov)LKP
on CONCAT('DEMAND~PROJECT_STATUS~',UPPER(request.STATUS_ID)) = LKP.row_id
AND LKP.source_id=SRC.sourceinstance
where coalesce(LKP.row_key,case when request.STATUS_ID is null then 0 else -1 end)<>coalesce(TRGT.demand_project_status_src_key,0) 