SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_success_model_monitor.algorithm_name' ELSE 'SUCCESS' END as Message
from (select * from  #STG_TABLE_SCHEMA.change_model_monitor_temp) SRC 
left join #DWH_TABLE_SCHEMA.d_change_success_model_monitor TRGT
on SRC.row_id=TRGT.row_id
and SRC.algorithm_name=TRGT.algorithm_name
where SRC.algorithm_name<>TRGT.algorithm_name


