SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_work_item.first_iteration_key' ELSE 'SUCCESS' END as Message
from (select * from  #STG_TABLE_SCHEMA.workitem_temp_azure  where cdctype<>'D') SRC

left join (
select tmp.issueid,tmp.sourceinstance, tmp.field, coalesce(tmp.to, tmp.tostring) first_iteration
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
join (
select tmp.issueid,tmp.sourceinstance, tmp.field, min(tmp.primary_sequence_id) first_iteration_prim_id
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
where upper(tmp.field) = 'ITERATION' and coalesce(`to`, tostring) is not null
group by tmp.issueid,tmp.sourceinstance, tmp.field
) base 
on tmp.issueid=base.issueid and tmp.sourceinstance=base.sourceinstance and tmp.field=base.field and tmp.primary_sequence_id = base.first_iteration_prim_id
where upper(tmp.field) = 'ITERATION'
) first_iteration
on SRC.__numerify__primary_key=first_iteration.issueid and SRC.sourceinstance=first_iteration.sourceinstance

left join #DWH_TABLE_SCHEMA.d_iteration ITE
on ITE.row_id=first_iteration.first_iteration and ITE.source_id=first_iteration.sourceinstance

left join  #DWH_TABLE_SCHEMA.d_work_item TRGT
on SRC.__numerify__primary_key=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id

where coalesce(ITE.row_key, case when first_iteration.first_iteration is null then 0 else -1 end) <> coalesce(TRGT.first_iteration_key,'');