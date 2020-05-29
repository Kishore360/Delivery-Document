SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.demand_requestor_key' ELSE 'SUCCESS' END as Message
from (select coalesce(con.row_key,case when SRC.created_by is null then 0 else -1 end),coalesce(TRGT.demand_requestor_key,'') from
(select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_internal_contact con
on con.row_id=concat('INTERNAL_CONTACT~',SRC.created_by)
and con.source_id=SRC.sourceinstance
where TRGT.primary_sequence_id<>0
and coalesce(con.row_key,case when SRC.created_by is null then 0 else -1 end)<>coalesce(TRGT.demand_requestor_key,'')
UNION 
select coalesce(TRGT.demand_requestor_key),null from #DWH_TABLE_SCHEMA.f_demand_activity TRGT
where TRGT.primary_sequence_id=0 and coalesce(TRGT.demand_requestor_key) is not null)a;