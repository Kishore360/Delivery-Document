
select  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_domain' ELSE 'SUCCESS' END as Message
from wow_workdb.ds_domain SRC
join wow_mdwdb.d_domain TRGT
on(SRC.row_id=TRGT.row_id
and SRC.source_id=TRGT.source_id)
where (concat(coalesce(SRC.row_id,''),coalesce(SRC.source_id,''),coalesce(SRC.domain_value,''),coalesce(SRC.domain_name,''),coalesce(SRC.created_by,''),coalesce(SRC.changed_by,''),coalesce(SRC.created_on,''),coalesce(SRC.changed_on,''),coalesce(SRC.active_flag,''),coalesce(SRC.domain_type,'')) )
<> (concat(coalesce(TRGT.row_id,''),coalesce(TRGT.source_id,''),coalesce(TRGT.domain_value,''),coalesce(TRGT.domain_name,''),coalesce(TRGT.created_by,''),coalesce(TRGT.changed_by,''),coalesce(TRGT.created_on,''),coalesce(TRGT.changed_on,''),coalesce(TRGT.active_flag,''),coalesce(TRGT.domain_type,'')) ); 
