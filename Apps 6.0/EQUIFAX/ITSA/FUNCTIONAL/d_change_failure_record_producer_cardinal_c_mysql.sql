SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.record_producer_cardinal_c' ELSE 'SUCCESS' END as Message 
FROM  equifax_mdsdb.change_request_final SRC
JOIN equifax_mdwdb.d_change_failure TRGT  
ON SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id  
left join (select row_id,source_id,grouped_value_c, value_c, predictor_variable_c
from equifax_mdwdb.d_predictor_variable_c
where soft_deleted_flag = 'N' and predictor_variable_c = 'record_producer_c'
) LKP
on TRGT.record_producer_c =LKP.value_c and TRGT.source_id=LKP.source_id
where TRGT.numerify_change_failure_flag <> 'X'  
and SRC.cdctype<>'D' and TRGT.current_flag='Y'
and TRGT.soft_deleted_flag = 'N'
and CASE WHEN LKP.value_c is null then 'num_grouped_others' ELSE LKP.grouped_value_c end <> TRGT.record_producer_cardinal_c 
and  SRC.cdctype<>'D';