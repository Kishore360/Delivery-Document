drop table if exists #STG_TABLE_SCHEMA.change_model_monitor_temp_bkp;

create table if not exists #STG_TABLE_SCHEMA.change_model_monitor_temp_bkp select * from #STG_TABLE_SCHEMA.change_model_monitor_temp;

set @baseschema := '#DWH_TABLE_SCHEMA';
set @workdb := '#STG_TABLE_SCHEMA';
set @basetable := 'd_change_failure';

set @script_open_records_delta := (select group_concat(concat('select SQ.change_request_key, SQ.change_failure_key, 
SQ.prediction_date, SQ.changed_by, SQ.changed_on, SQ.created_by, SQ.created_on, SQ.soft_deleted_flag, SQ.source_id, SQ.model_choice, SQ.row_id, SQ.algorithm_name, 
SQ.risk_factor, SQ.model_id, SQ.deployed_version, SQ.change_failure_flag, SQ.change_state_src_key, SQ.model_deployment_date, 
SQ.old_val, SQ.new_val
from (select out1.change_request_key, out1.row_key as change_failure_key, 
out1.dw_updated_on as prediction_date, out1.changed_by as changed_by, out1.changed_on as changed_on, out1.created_by as created_by, 
out1.created_on as created_on, out1.soft_deleted_flag as soft_deleted_flag, out1.source_id as source_id, ',
  case when SRC.algorithmName = 'DecisionTreeClassifier' then 1 when SRC.algorithmName = 'GBTBinaryClassifier' then 3 
  when SRC.algorithmName = 'RandomForestBinaryClassifier' then 2 end,' as model_choice, 
concat(out1.change_request_key, \'~\',', SRC.tracking_table_row_id, ', \'~\', \'', trim(SRC.FeatureName), '\', \'~\', out1.dw_updated_on) as row_id, \'', 
SRC.algorithmName, '\' as algorithm_name, \'', trim(SRC.FeatureName), '\' as \'risk_factor\', ', SRC.deployedModelVersionNumber, ' as deployed_version, 
out1.numerify_change_failure_flag as change_failure_flag, out1.change_state_src_key as change_state_src_key, \'',SRC.lastUpdatedOn,'\' as model_deployment_date, 
out1.', trim(SRC.FeatureName), ' as new_val, ', SRC.tracking_table_row_id, ' as model_id,
(select inn1.', trim(SRC.FeatureName), ' as c2 
from ', @baseschema, '.', @basetable, ' as inn1 
where inn1.change_request_key=out1.change_request_key and out1.effective_to>inn1.effective_to
and inn1.effective_to = (select min(inn2.effective_to) from ', @baseschema, '.', @basetable, ' as inn2
where inn2.change_request_key=inn1.change_request_key and inn2.effective_to<>out1.effective_to)) as old_val 
from (select * from ', @baseschema, '.', @basetable, ' where dw_inserted_on > (select max(prediction_date) from #STG_TABLE_SCHEMA.change_model_monitor_temp_bkp)) as out1 left join ( SELECT MAX(lastupdated) as lastupdated, source_id FROM ', @baseschema, '.d_o_data_freshness group by source_id ) dat on out1.source_id = dat.source_id \n
left join ', @baseschema, '.d_lov_map as status 
on out1.change_state_src_key = status.src_key and out1.source_id = status.source_id \n
where status.dimension_wh_code not in (\'CANCELED\', \'UNKNOWN\', \'UNSPECIFIED\') and concat(status.dimension_wh_code, \' - \', out1.effective_from) <> \'CLOSED - 1970-01-01 00:00:00\' and out1.change_request_key not in (0,-1) and out1.row_key not in (0,-1) \n) SQ \n
where SQ.new_val is not null and (coalesce(SQ.old_val,\'\')<>coalesce(SQ.new_val,\'\'))')  SEPARATOR '\n union \n')
from (select model.FeatureName, model.tracking_table_row_id, algo.algorithmName, algo.deployedModelVersionNumber, algo.lastUpdatedOn 
from #STG_TABLE_SCHEMA.model_base_temp model 
left join #STG_TABLE_SCHEMA.AS_DEPLOYED_MODELS algo 
on model.tracking_table_row_id = algo.row_id) SRC);


SELECT  @script_open_records_delta;

set @script_close_records_delta := (select group_concat(concat('select SQ.change_request_key, SQ.change_failure_key, 
SQ.prediction_date, SQ.changed_by, SQ.changed_on, SQ.created_by, SQ.created_on, SQ.soft_deleted_flag, SQ.source_id, SQ.model_choice, SQ.row_id, SQ.algorithm_name, 
SQ.risk_factor, SQ.model_id, SQ.deployed_version, SQ.change_failure_flag, SQ.change_state_src_key, SQ.model_deployment_date, 
SQ.old_val, SQ.new_val new_val
from (select out1.change_request_key, out1.row_key as change_failure_key, 
out1.dw_updated_on as prediction_date, out1.changed_by as changed_by, out1.changed_on as changed_on, out1.created_by as created_by, 
out1.created_on as created_on, out1.soft_deleted_flag as soft_deleted_flag, out1.source_id as source_id, ',
  case when SRC.algorithmName = 'DecisionTreeClassifier' then 1 when SRC.algorithmName = 'GBTBinaryClassifier' then 3 
  when SRC.algorithmName = 'RandomForestBinaryClassifier' then 2 end,' as model_choice, 
concat(out1.change_request_key, \'~\',', SRC.tracking_table_row_id, ', \'~\', out1.dw_updated_on) as row_id, \'', 
SRC.algorithmName, '\' as algorithm_name, NULL as risk_factor, ', SRC.deployedModelVersionNumber, ' as deployed_version, 
out1.numerify_change_failure_flag as change_failure_flag, out1.change_state_src_key as change_state_src_key, \'',SRC.lastUpdatedOn,'\' as model_deployment_date, 
NULL as new_val, ', SRC.tracking_table_row_id, ' as model_id, NULL as old_val 
from (select * from ', @baseschema, '.', @basetable, ' where dw_inserted_on > (select max(prediction_date) from #STG_TABLE_SCHEMA.change_model_monitor_temp_bkp)) as out1 left join ( SELECT MAX(lastupdated) as lastupdated, source_id FROM ', @baseschema, '.d_o_data_freshness group by source_id ) dat on out1.source_id = dat.source_id \n
left join ', @baseschema, '.d_lov_map as status 
on out1.change_state_src_key = status.src_key  and out1.source_id = status.source_id \n
where status.dimension_wh_code in (\'CLOSED\') and out1.current_flag = (\'Y\') and out1.change_request_key not in (0,-1) and out1.row_key not in (0,-1) \n) SQ \n')  SEPARATOR '\n union \n')
from (select model.FeatureName as FeatureName, model.tracking_table_row_id as tracking_table_row_id, algo.algorithmName as algorithmName, algo.deployedModelVersionNumber as deployedModelVersionNumber, algo.lastUpdatedOn as lastUpdatedOn
from #STG_TABLE_SCHEMA.model_base_temp model 
left join #STG_TABLE_SCHEMA.AS_DEPLOYED_MODELS algo 
on model.tracking_table_row_id = algo.row_id
where model.tracking_table_row_id = 3 
group by model.tracking_table_row_id, algo.algorithmName, algo.deployedModelVersionNumber, algo.lastUpdatedOn ) SRC);


SELECT  @script_close_records_delta;

set @insrt_open_delta := concat('insert into ', @workdb, '.change_model_monitor_temp (change_request_key, change_failure_key, prediction_date, changed_by, changed_on, created_by, created_on, soft_deleted_flag, source_id, model_choice, row_id, algorithm_name, risk_factor, model_id, deployed_version, change_failure_flag, change_state_src_key, model_deployment_date, previous_value, current_value) \n', @script_open_records_delta);

set @insrt_close_delta := concat('insert into ', @workdb, '.change_model_monitor_temp (change_request_key, change_failure_key, prediction_date, changed_by, changed_on, created_by, created_on, soft_deleted_flag, source_id, model_choice, row_id, algorithm_name, risk_factor, model_id, deployed_version, change_failure_flag, change_state_src_key, model_deployment_date, previous_value, current_value) \n', @script_close_records_delta);

prepare insrt_open_delta from @insrt_open_delta;
execute insrt_open_delta;
prepare insrt_close_delta from @insrt_close_delta;
execute insrt_close_delta;