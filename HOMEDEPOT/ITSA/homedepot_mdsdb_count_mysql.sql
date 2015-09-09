SELECT CASE WHEN CNT>0 THEN concat('FAILURE ON TABLE -',B.table_name) ELSE 'SUCCESS' END FROM 

( 
SELECT COUNT(1) AS CNT,group_concat(A.table_name) as table_name FROM

(
SELECT "_numerify_dataprofile_statistic_templates" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`_numerify_dataprofile_statistic_templates` UNION 
SELECT "_numerify_dataprofile_statistics" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`_numerify_dataprofile_statistics` UNION 
SELECT "_numerify_dataprofile_statistics_with_dict" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`_numerify_dataprofile_statistics_with_dict` UNION 
SELECT "change_request" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`change_request` UNION 
SELECT "change_request_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`change_request_bwd_delta` UNION 
SELECT "change_request_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`change_request_final` UNION 
SELECT "cmdb_categories" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_categories` UNION 
SELECT "cmdb_categories_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_categories_bwd_delta` UNION 
SELECT "cmdb_categories_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_categories_final` UNION 
SELECT "cmdb_ci" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_ci` UNION 
SELECT "cmdb_ci_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_ci_bwd_delta` UNION 
SELECT "cmdb_ci_database" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_ci_database` UNION 
SELECT "cmdb_ci_database_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_ci_database_bwd_delta` UNION 
SELECT "cmdb_ci_database_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_ci_database_final` UNION 
SELECT "cmdb_ci_db_catalog" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_ci_db_catalog` UNION 
SELECT "cmdb_ci_db_catalog_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_ci_db_catalog_bwd_delta` UNION 
SELECT "cmdb_ci_db_catalog_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_ci_db_catalog_final` UNION 
SELECT "cmdb_ci_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_ci_final` UNION 
SELECT "cmdb_model" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_model` UNION 
SELECT "cmdb_model_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_model_bwd_delta` UNION 
SELECT "cmdb_model_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmdb_model_final` UNION 
SELECT "cmn_cost_center" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmn_cost_center` UNION 
SELECT "cmn_cost_center_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmn_cost_center_bwd_delta` UNION 
SELECT "cmn_cost_center_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmn_cost_center_final` UNION 
SELECT "cmn_department" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmn_department` UNION 
SELECT "cmn_department_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmn_department_bwd_delta` UNION 
SELECT "cmn_department_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmn_department_final` UNION 
SELECT "cmn_location" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmn_location` UNION 
SELECT "cmn_location_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmn_location_bwd_delta` UNION 
SELECT "cmn_location_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`cmn_location_final` UNION 
SELECT "contract_sla" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`contract_sla` UNION 
SELECT "contract_sla_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`contract_sla_bwd_delta` UNION 
SELECT "contract_sla_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`contract_sla_final` UNION 
SELECT "core_company" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`core_company` UNION 
SELECT "core_company_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`core_company_bwd_delta` UNION 
SELECT "core_company_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`core_company_final` UNION 
SELECT "fx_currency" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`fx_currency` UNION 
SELECT "fx_currency_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`fx_currency_bwd_delta` UNION 
SELECT "fx_currency_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`fx_currency_final` UNION 
SELECT "fx_rate" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`fx_rate` UNION 
SELECT "fx_rate_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`fx_rate_bwd_delta` UNION 
SELECT "fx_rate_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`fx_rate_final` UNION 
SELECT "incident" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`incident` UNION 
SELECT "incident_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`incident_bwd_delta` UNION 
SELECT "incident_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`incident_final` UNION 
SELECT "internalaudittrail" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`internalaudittrail` UNION 
SELECT "internalentity" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`internalentity` UNION 
SELECT "internallongnames" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`internallongnames` UNION 
SELECT "internalstatus" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`internalstatus` UNION 
SELECT "pc_vendor_cat_item" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`pc_vendor_cat_item` UNION 
SELECT "pc_vendor_cat_item_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`pc_vendor_cat_item_bwd_delta` UNION 
SELECT "pc_vendor_cat_item_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`pc_vendor_cat_item_final` UNION 
SELECT "problem" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`problem` UNION 
SELECT "problem_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`problem_bwd_delta` UNION 
SELECT "problem_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`problem_final` UNION 
SELECT "sc_cat_item" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_cat_item` UNION 
SELECT "sc_cat_item_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_cat_item_bwd_delta` UNION 
SELECT "sc_cat_item_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_cat_item_final` UNION 
SELECT "sc_category" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_category` UNION 
SELECT "sc_category_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_category_bwd_delta` UNION 
SELECT "sc_category_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_category_final` UNION 
SELECT "sc_req_item" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_req_item` UNION 
SELECT "sc_req_item_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_req_item_bwd_delta` UNION 
SELECT "sc_req_item_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_req_item_final` UNION 
SELECT "sc_request" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_request` UNION 
SELECT "sc_request_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_request_bwd_delta` UNION 
SELECT "sc_request_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_request_final` UNION 
SELECT "sc_task" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_task` UNION 
SELECT "sc_task_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_task_bwd_delta` UNION 
SELECT "sc_task_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sc_task_final` UNION 
SELECT "sla" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sla` UNION 
SELECT "sla_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sla_bwd_delta` UNION 
SELECT "sla_condition_class" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sla_condition_class` UNION 
SELECT "sla_condition_class_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sla_condition_class_bwd_delta` UNION 
SELECT "sla_condition_class_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sla_condition_class_final` UNION 
SELECT "sla_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sla_final` UNION 
SELECT "survey_conditions" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_conditions` UNION 
SELECT "survey_conditions_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_conditions_bwd_delta` UNION 
SELECT "survey_conditions_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_conditions_final` UNION 
SELECT "survey_instance" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_instance` UNION 
SELECT "survey_instance_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_instance_bwd_delta` UNION 
SELECT "survey_instance_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_instance_final` UNION 
SELECT "survey_master" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_master` UNION 
SELECT "survey_master_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_master_bwd_delta` UNION 
SELECT "survey_master_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_master_final` UNION 
SELECT "survey_question_new" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_question_new` UNION 
SELECT "survey_question_new_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_question_new_bwd_delta` UNION 
SELECT "survey_question_new_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_question_new_final` UNION 
SELECT "survey_response" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_response` UNION 
SELECT "survey_response_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_response_bwd_delta` UNION 
SELECT "survey_response_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`survey_response_final` UNION 
SELECT "sys_audit" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_audit` UNION 
SELECT "sys_audit_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_audit_bwd_delta` UNION 
SELECT "sys_audit_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_audit_final` UNION 
SELECT "sys_choice" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_choice` UNION 
SELECT "sys_choice_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_choice_bwd_delta` UNION 
SELECT "sys_choice_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_choice_final` UNION 
SELECT "sys_db_object" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_db_object` UNION 
SELECT "sys_db_object_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_db_object_bwd_delta` UNION 
SELECT "sys_db_object_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_db_object_final` UNION 
SELECT "sys_dictionary" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_dictionary` UNION 
SELECT "sys_dictionary_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_dictionary_bwd_delta` UNION 
SELECT "sys_dictionary_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_dictionary_final` UNION 
SELECT "sys_user" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_user` UNION 
SELECT "sys_user_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_user_bwd_delta` UNION 
SELECT "sys_user_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_user_final` UNION 
SELECT "sys_user_grmember" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_user_grmember` UNION 
SELECT "sys_user_grmember_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_user_grmember_bwd_delta` UNION 
SELECT "sys_user_grmember_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_user_grmember_final` UNION 
SELECT "sys_user_group" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_user_group` UNION 
SELECT "sys_user_group_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_user_group_bwd_delta` UNION 
SELECT "sys_user_group_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_user_group_final` UNION 
SELECT "sys_user_has_role" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_user_has_role` UNION 
SELECT "sys_user_has_role_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_user_has_role_bwd_delta` UNION 
SELECT "sys_user_has_role_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`sys_user_has_role_final` UNION 
SELECT "task" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`task` UNION 
SELECT "task_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`task_bwd_delta` UNION 
SELECT "task_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`task_final` UNION 
SELECT "task_sla" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`task_sla` UNION 
SELECT "task_sla_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`task_sla_bwd_delta` UNION 
SELECT "task_sla_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`task_sla_final` UNION 
SELECT "task_survey" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`task_survey` UNION 
SELECT "task_survey_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`task_survey_bwd_delta` UNION 
SELECT "task_survey_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`task_survey_final` UNION 
SELECT "u_situation" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`u_situation` UNION 
SELECT "u_situation_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`u_situation_bwd_delta` UNION 
SELECT "u_situation_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`u_situation_final` UNION 
SELECT "us_accounttype" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_accounttype` UNION 
SELECT "us_accounttype_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_accounttype_bwd_delta` UNION 
SELECT "us_accounttype_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_accounttype_final` UNION 
SELECT "us_all_hierarchies" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_all_hierarchies` UNION 
SELECT "us_all_hierarchies_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_all_hierarchies_bwd_delta` UNION 
SELECT "us_all_hierarchies_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_all_hierarchies_final` UNION 
SELECT "us_change_request" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_change_request` UNION 
SELECT "us_change_request_age_bucket_lov" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_change_request_age_bucket_lov` UNION 
SELECT "us_change_request_age_bucket_lov_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_change_request_age_bucket_lov_bwd_delta` UNION 
SELECT "us_change_request_age_bucket_lov_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_change_request_age_bucket_lov_final` UNION 
SELECT "us_change_request_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_change_request_bwd_delta` UNION 
SELECT "us_change_request_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_change_request_final` UNION 
SELECT "us_change_request_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_change_request_map` UNION 
SELECT "us_change_request_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_change_request_map_bwd_delta` UNION 
SELECT "us_change_request_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_change_request_map_final` UNION 
SELECT "us_city_iso_codes" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_city_iso_codes` UNION 
SELECT "us_city_iso_codes_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_city_iso_codes_bwd_delta` UNION 
SELECT "us_city_iso_codes_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_city_iso_codes_final` UNION 
SELECT "us_city_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_city_map` UNION 
SELECT "us_city_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_city_map_bwd_delta` UNION 
SELECT "us_city_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_city_map_final` UNION 
SELECT "us_country_iso_codes" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_country_iso_codes` UNION 
SELECT "us_country_iso_codes_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_country_iso_codes_bwd_delta` UNION 
SELECT "us_country_iso_codes_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_country_iso_codes_final` UNION 
SELECT "us_country_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_country_map` UNION 
SELECT "us_country_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_country_map_bwd_delta` UNION 
SELECT "us_country_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_country_map_final` UNION 
SELECT "us_currency_iso_codes" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_currency_iso_codes` UNION 
SELECT "us_currency_iso_codes_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_currency_iso_codes_bwd_delta` UNION 
SELECT "us_currency_iso_codes_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_currency_iso_codes_final` UNION 
SELECT "us_currency_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_currency_map` UNION 
SELECT "us_currency_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_currency_map_bwd_delta` UNION 
SELECT "us_currency_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_currency_map_final` UNION 
SELECT "us_currency_rate_type_wh" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_currency_rate_type_wh` UNION 
SELECT "us_currency_rate_type_wh_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_currency_rate_type_wh_bwd_delta` UNION 
SELECT "us_currency_rate_type_wh_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_currency_rate_type_wh_final` UNION 
SELECT "us_employee_termination" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_employee_termination` UNION 
SELECT "us_employee_termination_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_employee_termination_bwd_delta` UNION 
SELECT "us_employee_termination_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_employee_termination_final` UNION 
SELECT "us_fin_status_lov_wh" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_fin_status_lov_wh` UNION 
SELECT "us_fin_status_lov_wh_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_fin_status_lov_wh_bwd_delta` UNION 
SELECT "us_fin_status_lov_wh_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_fin_status_lov_wh_final` UNION 
SELECT "us_financial_kpi" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_financial_kpi` UNION 
SELECT "us_financial_kpi_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_financial_kpi_bwd_delta` UNION 
SELECT "us_financial_kpi_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_financial_kpi_final` UNION 
SELECT "us_gender_iso_codes" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_gender_iso_codes` UNION 
SELECT "us_gender_iso_codes_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_gender_iso_codes_bwd_delta` UNION 
SELECT "us_gender_iso_codes_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_gender_iso_codes_final` UNION 
SELECT "us_gender_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_gender_map` UNION 
SELECT "us_gender_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_gender_map_bwd_delta` UNION 
SELECT "us_gender_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_gender_map_final` UNION 
SELECT "us_incident" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_incident` UNION 
SELECT "us_incident_age_bucket_lov" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_incident_age_bucket_lov` UNION 
SELECT "us_incident_age_bucket_lov_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_incident_age_bucket_lov_bwd_delta` UNION 
SELECT "us_incident_age_bucket_lov_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_incident_age_bucket_lov_final` UNION 
SELECT "us_incident_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_incident_bwd_delta` UNION 
SELECT "us_incident_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_incident_final` UNION 
SELECT "us_incident_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_incident_map` UNION 
SELECT "us_incident_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_incident_map_bwd_delta` UNION 
SELECT "us_incident_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_incident_map_final` UNION 
SELECT "us_itsm_kpi" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_itsm_kpi` UNION 
SELECT "us_itsm_kpi_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_itsm_kpi_bwd_delta` UNION 
SELECT "us_itsm_kpi_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_itsm_kpi_final` UNION 
SELECT "us_itsm_targets" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_itsm_targets` UNION 
SELECT "us_itsm_targets_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_itsm_targets_bwd_delta` UNION 
SELECT "us_itsm_targets_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_itsm_targets_final` UNION 
SELECT "us_mds_naturalaccounthier" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_mds_naturalaccounthier` UNION 
SELECT "us_mds_naturalaccounthier_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_mds_naturalaccounthier_bwd_delta` UNION 
SELECT "us_mds_naturalaccounthier_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_mds_naturalaccounthier_final` UNION 
SELECT "us_om_wh_codes" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_om_wh_codes` UNION 
SELECT "us_om_wh_codes_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_om_wh_codes_bwd_delta` UNION 
SELECT "us_om_wh_codes_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_om_wh_codes_final` UNION 
SELECT "us_problem" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_problem` UNION 
SELECT "us_problem_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_problem_bwd_delta` UNION 
SELECT "us_problem_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_problem_final` UNION 
SELECT "us_problem_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_problem_map` UNION 
SELECT "us_problem_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_problem_map_bwd_delta` UNION 
SELECT "us_problem_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_problem_map_final` UNION 
SELECT "us_question" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_question` UNION 
SELECT "us_question_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_question_bwd_delta` UNION 
SELECT "us_question_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_question_final` UNION 
SELECT "us_question_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_question_map` UNION 
SELECT "us_question_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_question_map_bwd_delta` UNION 
SELECT "us_question_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_question_map_final` UNION 
SELECT "us_request_age_bucket" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_request_age_bucket` UNION 
SELECT "us_request_age_bucket_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_request_age_bucket_bwd_delta` UNION 
SELECT "us_request_age_bucket_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_request_age_bucket_final` UNION 
SELECT "us_s_data_security_group" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_s_data_security_group` UNION 
SELECT "us_s_data_security_group_attribute_elements" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_s_data_security_group_attribute_elements` UNION 
SELECT "us_s_data_security_group_attribute_elements_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_s_data_security_group_attribute_elements_bwd_delta` UNION 
SELECT "us_s_data_security_group_attribute_elements_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_s_data_security_group_attribute_elements_final` UNION 
SELECT "us_s_data_security_group_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_s_data_security_group_bwd_delta` UNION 
SELECT "us_s_data_security_group_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_s_data_security_group_final` UNION 
SELECT "us_s_data_security_group_user" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_s_data_security_group_user` UNION 
SELECT "us_s_data_security_group_user_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_s_data_security_group_user_bwd_delta` UNION 
SELECT "us_s_data_security_group_user_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_s_data_security_group_user_final` UNION 
SELECT "us_sc_req_item" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_sc_req_item` UNION 
SELECT "us_sc_req_item_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_sc_req_item_bwd_delta` UNION 
SELECT "us_sc_req_item_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_sc_req_item_final` UNION 
SELECT "us_sc_req_item_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_sc_req_item_map` UNION 
SELECT "us_sc_req_item_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_sc_req_item_map_bwd_delta` UNION 
SELECT "us_sc_req_item_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_sc_req_item_map_final` UNION 
SELECT "us_sc_request" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_sc_request` UNION 
SELECT "us_sc_request_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_sc_request_bwd_delta` UNION 
SELECT "us_sc_request_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_sc_request_final` UNION 
SELECT "us_sc_request_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_sc_request_map` UNION 
SELECT "us_sc_request_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_sc_request_map_bwd_delta` UNION 
SELECT "us_sc_request_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_sc_request_map_final` UNION 
SELECT "us_state_iso_codes" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_state_iso_codes` UNION 
SELECT "us_state_iso_codes_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_state_iso_codes_bwd_delta` UNION 
SELECT "us_state_iso_codes_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_state_iso_codes_final` UNION 
SELECT "us_state_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_state_map` UNION 
SELECT "us_state_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_state_map_bwd_delta` UNION 
SELECT "us_state_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_state_map_final` UNION 
SELECT "us_task" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_task` UNION 
SELECT "us_task_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_task_bwd_delta` UNION 
SELECT "us_task_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_task_final` UNION 
SELECT "us_task_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_task_map` UNION 
SELECT "us_task_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_task_map_bwd_delta` UNION 
SELECT "us_task_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_task_map_final` UNION 
SELECT "us_task_sla" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_task_sla` UNION 
SELECT "us_task_sla_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_task_sla_bwd_delta` UNION 
SELECT "us_task_sla_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_task_sla_final` UNION 
SELECT "us_task_sla_map" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_task_sla_map` UNION 
SELECT "us_task_sla_map_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_task_sla_map_bwd_delta` UNION 
SELECT "us_task_sla_map_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_task_sla_map_final` UNION 
SELECT "us_tm_keyword_filter" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_tm_keyword_filter` UNION 
SELECT "us_tm_keyword_filter_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_tm_keyword_filter_bwd_delta` UNION 
SELECT "us_tm_keyword_filter_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_tm_keyword_filter_final` UNION 
SELECT "us_units" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_units` UNION 
SELECT "us_units_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_units_bwd_delta` UNION 
SELECT "us_units_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_units_final` UNION 
SELECT "us_wh_finbucket" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_wh_finbucket` UNION 
SELECT "us_wh_finbucket_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_wh_finbucket_bwd_delta` UNION 
SELECT "us_wh_finbucket_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`us_wh_finbucket_final` UNION 
SELECT "wf_stage" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`wf_stage` UNION 
SELECT "wf_stage_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`wf_stage_bwd_delta` UNION 
SELECT "wf_stage_default" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`wf_stage_default` UNION 
SELECT "wf_stage_default_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`wf_stage_default_bwd_delta` UNION 
SELECT "wf_stage_default_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`wf_stage_default_final` UNION 
SELECT "wf_stage_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`wf_stage_final` UNION 
SELECT "wf_workflow_version" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`wf_workflow_version` UNION 
SELECT "wf_workflow_version_bwd_delta" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`wf_workflow_version_bwd_delta` UNION 
SELECT "wf_workflow_version_final" AS table_name, COUNT(*) AS exact_row_count FROM `homedepot_mdsdb`.`wf_workflow_version_final` 
) A
where exact_row_count=0)B