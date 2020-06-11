/*known issue but have to check manually everytime*/
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.primary_sequence_id' ELSE 'SUCCESS' END as Message
from (select coalesce(TRGT.primary_sequence_id,101)
from (select transaction_id,REQUEST_ID, creation_date,@req :=REQUEST_ID,case when @req=@old then @rank :=@rank+1 else @rank :=1 end as ran,
@old :=REQUEST_ID,sourceinstance
from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final
order by REQUEST_ID,creation_date,transaction_id asc)SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.primary_sequence_id<>0
and coalesce(SRC.ran,100)<>coalesce(TRGT.primary_sequence_id,101)
UNION 
select TRGT1.primary_sequence_id from #DWH_TABLE_SCHEMA.f_demand_activity TRGT1
where TRGT1.primary_sequence_id=0 and 
coalesce(TRGT1.primary_sequence_id,100)<>0)a;