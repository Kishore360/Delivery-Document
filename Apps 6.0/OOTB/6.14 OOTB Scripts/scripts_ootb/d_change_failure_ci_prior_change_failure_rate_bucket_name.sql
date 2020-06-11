select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Only DWH lov validation failed for d_change_failure.ci_prior_change_failure_rate_bucket_name' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where row_key not in (-1,0) and soft_deleted_flag = 'N' and current_flag='Y') TRGT 
left outer join #DWH_TABLE_SCHEMA.d_lov lov 
on lov.dimension_class = 'WH_CI_PRIOR_CHANGES_FAILURE_RATE_BUCKETS'
and TRGT.ci_prior_failure_rate >= lov.lower_range_value and TRGT.ci_prior_failure_rate < lov.upper_range_value
 where coalesce(lov.dimension_name,'UNSPECIFIED') <> coalesce(TRGT.ci_prior_change_failure_rate_bucket_name,'');