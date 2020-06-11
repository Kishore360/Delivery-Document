select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Only DWH lov validation failed for d_change_failure.ag_prior_change_bucket_name' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where row_key not in (-1,0) and soft_deleted_flag = 'N' and current_flag='Y') TRGT 
left outer join #DWH_TABLE_SCHEMA.d_lov lov 
on lov.dimension_class = 'WH_AG_PRIOR_CHANGES_BUCKETS'
and TRGT.assignment_group_prior_changes between lov.lower_range_value and lov.upper_range_value
where coalesce(lov.dimension_name,'UNSPECIFIED') <> coalesce(TRGT.ag_prior_change_bucket_name,'');