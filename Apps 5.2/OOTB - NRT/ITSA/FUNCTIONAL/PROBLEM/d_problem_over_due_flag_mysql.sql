SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.over_due_flag' ELSE 'SUCCESS' END as Message FROM
 (
select 
( CASE WHEN SRC.active = TRUE and SRC.due_date < CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM <<tenant>>_mdwdb.d_o_data_freshness where (SRC.cdctime<=f1.lastupdated) and sourcename like 'ServiceNow%'),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>)then 'Y' else 'N' END),
 (TRGT.over_due_flag )
from
<<tenant>>_mdsdb.problem_final SRC
LEFT JOIN <<tenant>>_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and due_date is not  null and 
( CASE WHEN SRC.active = TRUE and SRC.due_date < CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM <<tenant>>_mdwdb.d_o_data_freshness where (SRC.cdctime<=f1.lastupdated) and sourcename like 'ServiceNow%' and etl_run_number=TRGT.etl_run_number),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>) then 'Y' else 'N' END)<>
 (TRGT.over_due_flag )
)a

