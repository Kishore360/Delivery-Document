SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.over_due_flag' ELSE 'SUCCESS' END as Message FROM
 (
select 
( CASE WHEN SRC.active = TRUE and SRC.due_date < CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM molinahealth02_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>)then 'Y' else 'N' END),
 (TRGT.over_due_flag )
from
molinahealth_mdsdb.problem_final SRC
LEFT JOIN molinahealth02_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE due_date is not  null and 
( CASE WHEN SRC.active = TRUE and SRC.due_date < CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM molinahealth02_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>) then 'Y' else 'N' END)<>
 (TRGT.over_due_flag )
)a
