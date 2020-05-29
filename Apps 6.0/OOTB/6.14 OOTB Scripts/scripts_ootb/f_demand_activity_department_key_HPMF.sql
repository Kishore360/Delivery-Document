SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.department_key' ELSE 'SUCCESS' END as Message
from (select coalesce(LKP.row_key,CASE WHEN src1.department_code IS NULL THEN 0 else '-1' end),
coalesce(TRGT.department_key) from (select 
case when SRC2.reference_code='_PFM_PROPOSAL' then SRC.request_id 
when SRC2.reference_code='_PROJECT_DETAILS' then SRC4.request_id end as new_demand,SRC.sourceinstance as sourceinstance,
SRC.transaction_id as transaction_id,SRC1.department_code as department_code

from (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
inner join #MDS_TABLE_SCHEMA.hp_kcrt_requests_final SRC1
on SRC1.request_id=SRC.request_id
and SRC1.sourceinstance=SRC.sourceinstance
inner join #MDS_TABLE_SCHEMA.hp_kcrt_request_types_nls_final SRC2
on SRC2.request_type_id=SRC1.request_type_id
and SRC2.sourceinstance=SRC1.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final SRC3
on SRC3.request_id=SRC.request_id
and SRC3.sourceinstance=SRC.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final SRC4
on SRC4.prop_project_id=SRC3.prj_project_id
and SRC4.sourceinstance=SRC3.sourceinstance
where SRC2.reference_code in ('_PFM_PROPOSAL') or SRC4.request_id is not null)src1
left join #DWH_TABLE_SCHEMA.d_internal_organization LKP
on CONCAT('DEPARTMENT~',UPPER(src1.department_code)) = LKP.row_id
and src1.sourceinstance = LKP.source_id
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on TRGT.row_id=src1.transaction_id
and TRGT.source_id=src1.sourceinstance
where TRGT.primary_sequence_id<>0
and coalesce(LKP.row_key,CASE WHEN src1.department_code IS NULL THEN 0 else '-1' end)<>coalesce(TRGT.DEPARTMENT_KEY,100)

union
-- storedprocedure is inserting the zeroth record and department key for all these records is null
select TRGT1.DEPARTMENT_KEY,null
from #DWH_TABLE_SCHEMA.f_demand_activity TRGT1
-- from #DWH_TABLE_SCHEMA.f_demand d_dem2
-- inner join #DWH_TABLE_SCHEMA.f_demand_activity TRGT1
-- on TRGT1.demand_key=d_dem2.row_key
where TRGT1.primary_sequence_id=0 and (TRGT1.DEPARTMENT_KEY) is not null)a;
-- coalesce(d_dem2.DEPARTMENT_KEY,200)<>coalesce(TRGT1.DEPARTMENT_KEY,0);