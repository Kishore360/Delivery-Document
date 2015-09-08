SELECT CASE WHEN CNT>0 THEN concat('FAILURE ON TABLE -',B.table_name) ELSE 'SUCCESS' END FROM 

( 
SELECT COUNT(1) AS CNT,group_concat(A.table_name) as table_name FROM


(
SELECT "DATABASECHANGELOG" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`DATABASECHANGELOG` UNION 
SELECT "DATABASECHANGELOGLOCK" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`DATABASECHANGELOGLOCK` UNION 
SELECT "DS_DATE_SEED" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`DS_DATE_SEED` UNION 
SELECT "d_ap_credit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ap_credit_memo_summary` UNION 
SELECT "d_ap_debit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ap_debit_memo_summary` UNION 
SELECT "d_ap_expense_category" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ap_expense_category` UNION 
SELECT "d_ap_invoice" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ap_invoice` UNION 
SELECT "d_ap_payment" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ap_payment` UNION 
SELECT "d_ar_cash_sale" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ar_cash_sale` UNION 
SELECT "d_ar_credit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ar_credit_memo_summary` UNION 
SELECT "d_ar_ct_deposit" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ar_ct_deposit` UNION 
SELECT "d_ar_debit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ar_debit_memo_summary` UNION 
SELECT "d_ar_invoice" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ar_invoice` UNION 
SELECT "d_ar_payment" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ar_payment` UNION 
SELECT "d_ar_payment_method" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ar_payment_method` UNION 
SELECT "d_calendar_date" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_calendar_date` UNION 
SELECT "d_calendar_list" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_calendar_list` UNION 
SELECT "d_calendar_time" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_calendar_time` UNION 
SELECT "d_change_request" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_change_request` UNION 
SELECT "d_configuration_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_configuration_item` UNION 
SELECT "d_contact" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_contact` UNION 
SELECT "d_cost_center" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_cost_center` UNION 
SELECT "d_currency_conversion" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_currency_conversion` UNION 
SELECT "d_customer_address" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_customer_address` UNION 
SELECT "d_dh_hierarchy_security" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_dh_hierarchy_security` UNION 
SELECT "d_domain" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_domain` UNION 
SELECT "d_dq_map" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_dq_map` UNION 
SELECT "d_facility_request" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_facility_request` UNION 
SELECT "d_fiscal_period" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_fiscal_period` UNION 
SELECT "d_fiscal_quarter" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_fiscal_quarter` UNION 
SELECT "d_fiscal_year" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_fiscal_year` UNION 
SELECT "d_geography" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_geography` UNION 
SELECT "d_gl_account" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_gl_account` UNION 
SELECT "d_gl_segment" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_gl_segment` UNION 
SELECT "d_h_all_hierarchies" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_h_all_hierarchies` UNION 
SELECT "d_hr_employee" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_hr_employee` UNION 
SELECT "d_incident" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_incident` UNION 
SELECT "d_internal_contact" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_internal_contact` UNION 
SELECT "d_internal_organization" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_internal_organization` UNION 
SELECT "d_keyword_filter" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_keyword_filter` UNION 
SELECT "d_ledger" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_ledger` UNION 
SELECT "d_location" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_location` UNION 
SELECT "d_lov" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_lov` UNION 
SELECT "d_lov_map" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_lov_map` UNION 
SELECT "d_malware_tracking_c" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_malware_tracking_c` UNION 
SELECT "d_master_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_master_item` UNION 
SELECT "d_month" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_month` UNION 
SELECT "d_natural_account" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_natural_account` UNION 
SELECT "d_o_data_freshness" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_o_data_freshness` UNION 
SELECT "d_organization_customer" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_organization_customer` UNION 
SELECT "d_partner" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_partner` UNION 
SELECT "d_party" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_party` UNION 
SELECT "d_payment_terms" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_payment_terms` UNION 
SELECT "d_problem" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_problem` UNION 
SELECT "d_problem_task" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_problem_task` UNION 
SELECT "d_project" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_project` UNION 
SELECT "d_purchase_order" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_purchase_order` UNION 
SELECT "d_purchase_order_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_purchase_order_detail` UNION 
SELECT "d_quarter" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_quarter` UNION 
SELECT "d_request" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_request` UNION 
SELECT "d_request_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_request_item` UNION 
SELECT "d_request_task" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_request_task` UNION 
SELECT "d_roles" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_roles` UNION 
SELECT "d_s_data_security_group" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_s_data_security_group` UNION 
SELECT "d_s_data_security_group_attribute_elements" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_s_data_security_group_attribute_elements` UNION 
SELECT "d_s_data_security_group_users" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_s_data_security_group_users` UNION 
SELECT "d_sales_contract" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_sales_contract` UNION 
SELECT "d_sales_contract_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_sales_contract_item` UNION 
SELECT "d_sales_order" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_sales_order` UNION 
SELECT "d_sales_order_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_sales_order_item` UNION 
SELECT "d_storage_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_storage_item` UNION 
SELECT "d_supplier" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_supplier` UNION 
SELECT "d_supplier_account" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_supplier_account` UNION 
SELECT "d_supplier_address" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_supplier_address` UNION 
SELECT "d_supplier_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_supplier_item` UNION 
SELECT "d_survey" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_survey` UNION 
SELECT "d_survey_instance" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_survey_instance` UNION 
SELECT "d_survey_question" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_survey_question` UNION 
SELECT "d_task_sla" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_task_sla` UNION 
SELECT "d_uom_conversion" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_uom_conversion` UNION 
SELECT "d_vendiing_product_c" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_vendiing_product_c` UNION 
SELECT "d_vending_machine_c" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_vending_machine_c` UNION 
SELECT "d_year" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`d_year` UNION 
SELECT "ds_ap_credit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ap_credit_memo_summary` UNION 
SELECT "ds_ap_debit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ap_debit_memo_summary` UNION 
SELECT "ds_ap_expense_category" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ap_expense_category` UNION 
SELECT "ds_ap_invoice" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ap_invoice` UNION 
SELECT "ds_ap_payment" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ap_payment` UNION 
SELECT "ds_ar_cash_sale" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ar_cash_sale` UNION 
SELECT "ds_ar_credit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ar_credit_memo_summary` UNION 
SELECT "ds_ar_ct_deposit" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ar_ct_deposit` UNION 
SELECT "ds_ar_debit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ar_debit_memo_summary` UNION 
SELECT "ds_ar_invoice" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ar_invoice` UNION 
SELECT "ds_ar_payment" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ar_payment` UNION 
SELECT "ds_ar_payment_method" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ar_payment_method` UNION 
SELECT "ds_calendar_date" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_calendar_date` UNION 
SELECT "ds_calendar_list" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_calendar_list` UNION 
SELECT "ds_calendar_time" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_calendar_time` UNION 
SELECT "ds_change_request" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_change_request` UNION 
SELECT "ds_configuration_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_configuration_item` UNION 
SELECT "ds_contact" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_contact` UNION 
SELECT "ds_cost_center" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_cost_center` UNION 
SELECT "ds_currency_conversion" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_currency_conversion` UNION 
SELECT "ds_customer_address" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_customer_address` UNION 
SELECT "ds_dh_hierarchy_security" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_dh_hierarchy_security` UNION 
SELECT "ds_domain" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_domain` UNION 
SELECT "ds_dq_map" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_dq_map` UNION 
SELECT "ds_facility_request" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_facility_request` UNION 
SELECT "ds_fiscal_period" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_fiscal_period` UNION 
SELECT "ds_fiscal_quarter" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_fiscal_quarter` UNION 
SELECT "ds_fiscal_year" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_fiscal_year` UNION 
SELECT "ds_geography" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_geography` UNION 
SELECT "ds_gl_account" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_gl_account` UNION 
SELECT "ds_gl_segment" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_gl_segment` UNION 
SELECT "ds_h_all_hierarchies" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_h_all_hierarchies` UNION 
SELECT "ds_hr_employee" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_hr_employee` UNION 
SELECT "ds_incident" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_incident` UNION 
SELECT "ds_internal_contact" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_internal_contact` UNION 
SELECT "ds_internal_organization" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_internal_organization` UNION 
SELECT "ds_keyword_filter" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_keyword_filter` UNION 
SELECT "ds_ledger" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_ledger` UNION 
SELECT "ds_location" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_location` UNION 
SELECT "ds_lov" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_lov` UNION 
SELECT "ds_lov_map" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_lov_map` UNION 
SELECT "ds_malware_tracking_c" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_malware_tracking_c` UNION 
SELECT "ds_master_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_master_item` UNION 
SELECT "ds_month" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_month` UNION 
SELECT "ds_natural_account" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_natural_account` UNION 
SELECT "ds_o_data_freshness" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_o_data_freshness` UNION 
SELECT "ds_organization_customer" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_organization_customer` UNION 
SELECT "ds_partner" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_partner` UNION 
SELECT "ds_party" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_party` UNION 
SELECT "ds_payment_terms" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_payment_terms` UNION 
SELECT "ds_problem" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_problem` UNION 
SELECT "ds_problem_task" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_problem_task` UNION 
SELECT "ds_project" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_project` UNION 
SELECT "ds_purchase_order" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_purchase_order` UNION 
SELECT "ds_purchase_order_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_purchase_order_detail` UNION 
SELECT "ds_quarter" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_quarter` UNION 
SELECT "ds_request" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_request` UNION 
SELECT "ds_request_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_request_item` UNION 
SELECT "ds_request_task" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_request_task` UNION 
SELECT "ds_roles" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_roles` UNION 
SELECT "ds_s_data_security_group" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_s_data_security_group` UNION 
SELECT "ds_s_data_security_group_attribute_elements" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_s_data_security_group_attribute_elements` UNION 
SELECT "ds_s_data_security_group_users" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_s_data_security_group_users` UNION 
SELECT "ds_sales_contract" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_sales_contract` UNION 
SELECT "ds_sales_contract_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_sales_contract_item` UNION 
SELECT "ds_sales_order" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_sales_order` UNION 
SELECT "ds_sales_order_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_sales_order_item` UNION 
SELECT "ds_storage_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_storage_item` UNION 
SELECT "ds_supplier" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_supplier` UNION 
SELECT "ds_supplier_account" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_supplier_account` UNION 
SELECT "ds_supplier_address" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_supplier_address` UNION 
SELECT "ds_supplier_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_supplier_item` UNION 
SELECT "ds_survey" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_survey` UNION 
SELECT "ds_survey_instance" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_survey_instance` UNION 
SELECT "ds_survey_question" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_survey_question` UNION 
SELECT "ds_task_sla" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_task_sla` UNION 
SELECT "ds_uom_conversion" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_uom_conversion` UNION 
SELECT "ds_vendiing_product_c" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_vendiing_product_c` UNION 
SELECT "ds_vending_machine_c" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_vending_machine_c` UNION 
SELECT "ds_year" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`ds_year` UNION 
SELECT "etl_f_keyword_temp" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`etl_f_keyword_temp` UNION 
SELECT "f_a_incident_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_a_incident_monthly` UNION 
SELECT "f_a_sales_order_item_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_a_sales_order_item_monthly` UNION 
SELECT "f_ap_credit_memo_application" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ap_credit_memo_application` UNION 
SELECT "f_ap_credit_memo_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ap_credit_memo_detail` UNION 
SELECT "f_ap_credit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ap_credit_memo_summary` UNION 
SELECT "f_ap_debit_memo_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ap_debit_memo_detail` UNION 
SELECT "f_ap_debit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ap_debit_memo_summary` UNION 
SELECT "f_ap_invoice" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ap_invoice` UNION 
SELECT "f_ap_invoice_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ap_invoice_detail` UNION 
SELECT "f_ap_payment" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ap_payment` UNION 
SELECT "f_ap_payment_application" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ap_payment_application` UNION 
SELECT "f_ar_cash_sale" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_cash_sale` UNION 
SELECT "f_ar_cash_sale_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_cash_sale_detail` UNION 
SELECT "f_ar_credit_memo_application" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_credit_memo_application` UNION 
SELECT "f_ar_credit_memo_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_credit_memo_detail` UNION 
SELECT "f_ar_credit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_credit_memo_summary` UNION 
SELECT "f_ar_ct_deposit" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_ct_deposit` UNION 
SELECT "f_ar_ct_deposit_application" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_ct_deposit_application` UNION 
SELECT "f_ar_ct_refund" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_ct_refund` UNION 
SELECT "f_ar_debit_memo_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_debit_memo_detail` UNION 
SELECT "f_ar_debit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_debit_memo_summary` UNION 
SELECT "f_ar_invoice" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_invoice` UNION 
SELECT "f_ar_invoice_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_invoice_detail` UNION 
SELECT "f_ar_payment" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_payment` UNION 
SELECT "f_ar_payment_application" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_ar_payment_application` UNION 
SELECT "f_change_request" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_change_request` UNION 
SELECT "f_employee_termination" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_employee_termination` UNION 
SELECT "f_facility_request" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_facility_request` UNION 
SELECT "f_fin_relationship_profile" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_fin_relationship_profile` UNION 
SELECT "f_financials_target" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_financials_target` UNION 
SELECT "f_gl_balance" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_gl_balance` UNION 
SELECT "f_gl_budget" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_gl_budget` UNION 
SELECT "f_gl_journal" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_gl_journal` UNION 
SELECT "f_incident" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_incident` UNION 
SELECT "f_itsm_target" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_itsm_target` UNION 
SELECT "f_keyword" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_keyword` UNION 
SELECT "f_malware_tracking_c" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_malware_tracking_c` UNION 
SELECT "f_n_ap_credit_memo_summary_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_n_ap_credit_memo_summary_monthly` UNION 
SELECT "f_n_ap_invoice_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_n_ap_invoice_monthly` UNION 
SELECT "f_n_ap_payment_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_n_ap_payment_monthly` UNION 
SELECT "f_n_ar_credit_memo_summary_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_n_ar_credit_memo_summary_monthly` UNION 
SELECT "f_n_ar_ct_deposit_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_n_ar_ct_deposit_monthly` UNION 
SELECT "f_n_ar_ct_refund_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_n_ar_ct_refund_monthly` UNION 
SELECT "f_n_ar_invoice_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_n_ar_invoice_monthly` UNION 
SELECT "f_n_ar_payment_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_n_ar_payment_monthly` UNION 
SELECT "f_n_incident_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_n_incident_monthly` UNION 
SELECT "f_n_incident_weekly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_n_incident_weekly` UNION 
SELECT "f_problem" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_problem` UNION 
SELECT "f_problem_task" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_problem_task` UNION 
SELECT "f_purchase_order" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_purchase_order` UNION 
SELECT "f_purchase_order_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_purchase_order_detail` UNION 
SELECT "f_request" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_request` UNION 
SELECT "f_request_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_request_item` UNION 
SELECT "f_request_task" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_request_task` UNION 
SELECT "f_response" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_response` UNION 
SELECT "f_sales_contract_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_sales_contract_item` UNION 
SELECT "f_sales_order" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_sales_order` UNION 
SELECT "f_sales_order_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_sales_order_item` UNION 
SELECT "f_so_po_cube" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_so_po_cube` UNION 
SELECT "f_t_task_activity" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_t_task_activity` UNION 
SELECT "f_task_sla" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_task_sla` UNION 
SELECT "f_task_survey" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_task_survey` UNION 
SELECT "f_vending_machine_c" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`f_vending_machine_c` UNION 
SELECT "fs_a_incident_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_a_incident_monthly` UNION 
SELECT "fs_a_sales_order_item_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_a_sales_order_item_monthly` UNION 
SELECT "fs_ap_credit_memo_application" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ap_credit_memo_application` UNION 
SELECT "fs_ap_credit_memo_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ap_credit_memo_detail` UNION 
SELECT "fs_ap_credit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ap_credit_memo_summary` UNION 
SELECT "fs_ap_debit_memo_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ap_debit_memo_detail` UNION 
SELECT "fs_ap_debit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ap_debit_memo_summary` UNION 
SELECT "fs_ap_invoice" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ap_invoice` UNION 
SELECT "fs_ap_invoice_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ap_invoice_detail` UNION 
SELECT "fs_ap_payment" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ap_payment` UNION 
SELECT "fs_ap_payment_application" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ap_payment_application` UNION 
SELECT "fs_ar_cash_sale" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_cash_sale` UNION 
SELECT "fs_ar_cash_sale_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_cash_sale_detail` UNION 
SELECT "fs_ar_credit_memo_application" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_credit_memo_application` UNION 
SELECT "fs_ar_credit_memo_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_credit_memo_detail` UNION 
SELECT "fs_ar_credit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_credit_memo_summary` UNION 
SELECT "fs_ar_ct_deposit" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_ct_deposit` UNION 
SELECT "fs_ar_ct_deposit_application" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_ct_deposit_application` UNION 
SELECT "fs_ar_ct_refund" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_ct_refund` UNION 
SELECT "fs_ar_debit_memo_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_debit_memo_detail` UNION 
SELECT "fs_ar_debit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_debit_memo_summary` UNION 
SELECT "fs_ar_invoice" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_invoice` UNION 
SELECT "fs_ar_invoice_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_invoice_detail` UNION 
SELECT "fs_ar_payment" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_payment` UNION 
SELECT "fs_ar_payment_application" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_ar_payment_application` UNION 
SELECT "fs_change_request" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_change_request` UNION 
SELECT "fs_employee_termination" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_employee_termination` UNION 
SELECT "fs_facility_request" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_facility_request` UNION 
SELECT "fs_fin_relationship_profile" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_fin_relationship_profile` UNION 
SELECT "fs_financials_target" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_financials_target` UNION 
SELECT "fs_gl_balance" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_gl_balance` UNION 
SELECT "fs_gl_budget" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_gl_budget` UNION 
SELECT "fs_gl_journal" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_gl_journal` UNION 
SELECT "fs_incident" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_incident` UNION 
SELECT "fs_itsm_target" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_itsm_target` UNION 
SELECT "fs_keyword" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_keyword` UNION 
SELECT "fs_malware_tracking_c" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_malware_tracking_c` UNION 
SELECT "fs_n_ap_credit_memo_summary_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_n_ap_credit_memo_summary_monthly` UNION 
SELECT "fs_n_ap_invoice_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_n_ap_invoice_monthly` UNION 
SELECT "fs_n_ap_payment_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_n_ap_payment_monthly` UNION 
SELECT "fs_n_ar_credit_memo_summary_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_n_ar_credit_memo_summary_monthly` UNION 
SELECT "fs_n_ar_ct_deposit_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_n_ar_ct_deposit_monthly` UNION 
SELECT "fs_n_ar_ct_refund_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_n_ar_ct_refund_monthly` UNION 
SELECT "fs_n_ar_invoice_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_n_ar_invoice_monthly` UNION 
SELECT "fs_n_ar_payment_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_n_ar_payment_monthly` UNION 
SELECT "fs_n_incident_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_n_incident_monthly` UNION 
SELECT "fs_n_incident_weekly" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_n_incident_weekly` UNION 
SELECT "fs_problem" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_problem` UNION 
SELECT "fs_problem_task" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_problem_task` UNION 
SELECT "fs_purchase_order" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_purchase_order` UNION 
SELECT "fs_purchase_order_detail" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_purchase_order_detail` UNION 
SELECT "fs_request" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_request` UNION 
SELECT "fs_request_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_request_item` UNION 
SELECT "fs_request_task" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_request_task` UNION 
SELECT "fs_response" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_response` UNION 
SELECT "fs_sales_contract_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_sales_contract_item` UNION 
SELECT "fs_sales_order" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_sales_order` UNION 
SELECT "fs_sales_order_item" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_sales_order_item` UNION 
SELECT "fs_so_po_cube" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_so_po_cube` UNION 
SELECT "fs_t_task_activity" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_t_task_activity` UNION 
SELECT "fs_task_sla" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_task_sla` UNION 
SELECT "fs_task_survey" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_task_survey` UNION 
SELECT "fs_vending_machine_c" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`fs_vending_machine_c` UNION 
SELECT "load_table" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`load_table` UNION 
SELECT "lsm_ls_dw_aggregator" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`lsm_ls_dw_aggregator` UNION 
SELECT "lsm_ls_dw_snapshot_audit" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`lsm_ls_dw_snapshot_audit` UNION 
SELECT "lsm_ls_etl_latest_task_run" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`lsm_ls_etl_latest_task_run` UNION 
SELECT "lsm_ls_etl_log" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`lsm_ls_etl_log` UNION 
SELECT "lsm_ls_hierarchies" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`lsm_ls_hierarchies` UNION 
SELECT "lsm_ls_hierarchy_log" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`lsm_ls_hierarchy_log` UNION 
SELECT "lsm_ls_keyword_metadata" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`lsm_ls_keyword_metadata` UNION 
SELECT "lsm_ls_lov_metadata" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`lsm_ls_lov_metadata` UNION 
SELECT "lsm_ls_system_variables" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`lsm_ls_system_variables` UNION 
SELECT "lsm_ls_validation" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`lsm_ls_validation` UNION 
SELECT "mds_all_hierarchies" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`mds_all_hierarchies` UNION 
SELECT "netflix_TESTREPORT" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`netflix_TESTREPORT` UNION 
SELECT "o_data_freshness" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`o_data_freshness` UNION 
SELECT "text_mining_temp" AS table_name, COUNT(*) AS exact_row_count FROM `netflix_workdb`.`text_mining_temp` 
) A



where exact_row_count=0)B