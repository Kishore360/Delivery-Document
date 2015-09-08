SELECT CASE WHEN CNT>0 THEN concat('FAILURE ON TABLE -',B.table_name) ELSE 'SUCCESS' END FROM 

( 
SELECT COUNT(1) AS CNT,group_concat(A.table_name) as table_name FROM



(
SELECT "d_ap_credit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ap_credit_memo_summary` UNION 
SELECT "d_ap_debit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ap_debit_memo_summary` UNION 
SELECT "d_ap_expense_category" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ap_expense_category` UNION 
SELECT "d_ap_invoice" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ap_invoice` UNION 
SELECT "d_ap_payment" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ap_payment` UNION 
SELECT "d_ar_cash_sale" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ar_cash_sale` UNION 
SELECT "d_ar_credit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ar_credit_memo_summary` UNION 
SELECT "d_ar_ct_deposit" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ar_ct_deposit` UNION 
SELECT "d_ar_debit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ar_debit_memo_summary` UNION 
SELECT "d_ar_invoice" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ar_invoice` UNION 
SELECT "d_ar_payment" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ar_payment` UNION 
SELECT "d_ar_payment_method" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ar_payment_method` UNION 
SELECT "d_calendar_date" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_calendar_date` UNION 
SELECT "d_calendar_list" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_calendar_list` UNION 
SELECT "d_calendar_time" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_calendar_time` UNION 
SELECT "d_change_request" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_change_request` UNION 
SELECT "d_configuration_item" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_configuration_item` UNION 
SELECT "d_contact" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_contact` UNION 
SELECT "d_cost_center" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_cost_center` UNION 
SELECT "d_currency_conversion" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_currency_conversion` UNION 
SELECT "d_customer_address" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_customer_address` UNION 
SELECT "d_dh_hierarchy_security" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_dh_hierarchy_security` UNION 
SELECT "d_domain" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_domain` UNION 
SELECT "d_dq_map" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_dq_map` UNION 
SELECT "d_facility_request" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_facility_request` UNION 
SELECT "d_fiscal_period" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_fiscal_period` UNION 
SELECT "d_fiscal_quarter" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_fiscal_quarter` UNION 
SELECT "d_fiscal_year" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_fiscal_year` UNION 
SELECT "d_geography" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_geography` UNION 
SELECT "d_gl_account" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_gl_account` UNION 
SELECT "d_gl_segment" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_gl_segment` UNION 
SELECT "d_h_all_hierarchies" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_h_all_hierarchies` UNION 
SELECT "d_hr_employee" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_hr_employee` UNION 
SELECT "d_incident" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_incident` UNION 
SELECT "d_internal_contact" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_internal_contact` UNION 
SELECT "d_internal_organization" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_internal_organization` UNION 
SELECT "d_keyword_filter" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_keyword_filter` UNION 
SELECT "d_ledger" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_ledger` UNION 
SELECT "d_location" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_location` UNION 
SELECT "d_lov" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_lov` UNION 
SELECT "d_lov_map" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_lov_map` UNION 
SELECT "d_master_item" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_master_item` UNION 
SELECT "d_month" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_month` UNION 
SELECT "d_natural_account" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_natural_account` UNION 
SELECT "d_o_data_freshness" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_o_data_freshness` UNION 
SELECT "d_organization_customer" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_organization_customer` UNION 
SELECT "d_partner" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_partner` UNION 
SELECT "d_party" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_party` UNION 
SELECT "d_payment_terms" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_payment_terms` UNION 
SELECT "d_problem" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_problem` UNION 
SELECT "d_problem_task" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_problem_task` UNION 
SELECT "d_project" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_project` UNION 
SELECT "d_purchase_order" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_purchase_order` UNION 
SELECT "d_purchase_order_detail" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_purchase_order_detail` UNION 
SELECT "d_quarter" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_quarter` UNION 
SELECT "d_request" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_request` UNION 
SELECT "d_request_item" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_request_item` UNION 
SELECT "d_request_task" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_request_task` UNION 
SELECT "d_roles" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_roles` UNION 
SELECT "d_s_data_security_group" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_s_data_security_group` UNION 
SELECT "d_s_data_security_group_attribute_elements" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_s_data_security_group_attribute_elements` UNION 
SELECT "d_s_data_security_group_users" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_s_data_security_group_users` UNION 
SELECT "d_sales_contract" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_sales_contract` UNION 
SELECT "d_sales_contract_item" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_sales_contract_item` UNION 
SELECT "d_sales_order" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_sales_order` UNION 
SELECT "d_sales_order_item" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_sales_order_item` UNION 
SELECT "d_storage_item" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_storage_item` UNION 
SELECT "d_supplier" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_supplier` UNION 
SELECT "d_supplier_account" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_supplier_account` UNION 
SELECT "d_supplier_address" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_supplier_address` UNION 
SELECT "d_supplier_item" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_supplier_item` UNION 
SELECT "d_survey" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_survey` UNION 
SELECT "d_survey_instance" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_survey_instance` UNION 
SELECT "d_survey_question" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_survey_question` UNION 
SELECT "d_task_sla" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_task_sla` UNION 
SELECT "d_uom_conversion" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_uom_conversion` UNION 
SELECT "d_year" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`d_year` UNION 
SELECT "f_a_incident_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_a_incident_monthly` UNION 
SELECT "f_a_sales_order_item_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_a_sales_order_item_monthly` UNION 
SELECT "f_ap_credit_memo_application" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ap_credit_memo_application` UNION 
SELECT "f_ap_credit_memo_detail" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ap_credit_memo_detail` UNION 
SELECT "f_ap_credit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ap_credit_memo_summary` UNION 
SELECT "f_ap_debit_memo_detail" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ap_debit_memo_detail` UNION 
SELECT "f_ap_debit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ap_debit_memo_summary` UNION 
SELECT "f_ap_invoice" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ap_invoice` UNION 
SELECT "f_ap_invoice_detail" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ap_invoice_detail` UNION 
SELECT "f_ap_payment" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ap_payment` UNION 
SELECT "f_ap_payment_application" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ap_payment_application` UNION 
SELECT "f_ar_cash_sale" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_cash_sale` UNION 
SELECT "f_ar_cash_sale_detail" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_cash_sale_detail` UNION 
SELECT "f_ar_credit_memo_application" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_credit_memo_application` UNION 
SELECT "f_ar_credit_memo_detail" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_credit_memo_detail` UNION 
SELECT "f_ar_credit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_credit_memo_summary` UNION 
SELECT "f_ar_ct_deposit" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_ct_deposit` UNION 
SELECT "f_ar_ct_deposit_application" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_ct_deposit_application` UNION 
SELECT "f_ar_ct_refund" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_ct_refund` UNION 
SELECT "f_ar_debit_memo_detail" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_debit_memo_detail` UNION 
SELECT "f_ar_debit_memo_summary" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_debit_memo_summary` UNION 
SELECT "f_ar_invoice" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_invoice` UNION 
SELECT "f_ar_invoice_detail" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_invoice_detail` UNION 
SELECT "f_ar_payment" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_payment` UNION 
SELECT "f_ar_payment_application" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_ar_payment_application` UNION 
SELECT "f_change_request" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_change_request` UNION 
SELECT "f_employee_termination" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_employee_termination` UNION 
SELECT "f_facility_request" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_facility_request` UNION 
SELECT "f_fin_relationship_profile" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_fin_relationship_profile` UNION 
SELECT "f_financials_target" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_financials_target` UNION 
SELECT "f_gl_balance" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_gl_balance` UNION 
SELECT "f_gl_budget" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_gl_budget` UNION 
SELECT "f_gl_journal" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_gl_journal` UNION 
SELECT "f_incident" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_incident` UNION 
SELECT "f_incident_monthly_temp" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_incident_monthly_temp` UNION 
SELECT "f_itsm_target" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_itsm_target` UNION 
SELECT "f_keyword" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_keyword` UNION 
SELECT "f_n_ap_credit_memo_summary_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_n_ap_credit_memo_summary_monthly` UNION 
SELECT "f_n_ap_invoice_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_n_ap_invoice_monthly` UNION 
SELECT "f_n_ap_payment_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_n_ap_payment_monthly` UNION 
SELECT "f_n_ar_credit_memo_summary_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_n_ar_credit_memo_summary_monthly` UNION 
SELECT "f_n_ar_ct_deposit_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_n_ar_ct_deposit_monthly` UNION 
SELECT "f_n_ar_ct_refund_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_n_ar_ct_refund_monthly` UNION 
SELECT "f_n_ar_invoice_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_n_ar_invoice_monthly` UNION 
SELECT "f_n_ar_payment_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_n_ar_payment_monthly` UNION 
SELECT "f_n_incident_monthly" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_n_incident_monthly` UNION 
SELECT "f_n_incident_weekly" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_n_incident_weekly` UNION 
SELECT "f_problem" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_problem` UNION 
SELECT "f_problem_task" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_problem_task` UNION 
SELECT "f_purchase_order" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_purchase_order` UNION 
SELECT "f_purchase_order_detail" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_purchase_order_detail` UNION 
SELECT "f_request" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_request` UNION 
SELECT "f_request_item" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_request_item` UNION 
SELECT "f_request_task" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_request_task` UNION 
SELECT "f_response" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_response` UNION 
SELECT "f_sales_contract_item" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_sales_contract_item` UNION 
SELECT "f_sales_order" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_sales_order` UNION 
SELECT "f_sales_order_item" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_sales_order_item` UNION 
SELECT "f_so_po_cube" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_so_po_cube` UNION 
SELECT "f_t_task_activity" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_t_task_activity` UNION 
SELECT "f_task_sla" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_task_sla` UNION 
SELECT "f_task_survey" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`f_task_survey` UNION 
SELECT "lsm_ls_dw_aggregator" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`lsm_ls_dw_aggregator` UNION 
SELECT "lsm_ls_dw_snapshot_audit" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`lsm_ls_dw_snapshot_audit` UNION 
SELECT "lsm_ls_etl_latest_task_run" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`lsm_ls_etl_latest_task_run` UNION 
SELECT "lsm_ls_etl_log" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`lsm_ls_etl_log` UNION 
SELECT "lsm_ls_hierarchies" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`lsm_ls_hierarchies` UNION 
SELECT "lsm_ls_keyword_metadata" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`lsm_ls_keyword_metadata` UNION 
SELECT "lsm_ls_lov_metadata" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`lsm_ls_lov_metadata` UNION 
SELECT "lsm_ls_system_variables" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`lsm_ls_system_variables` UNION 
SELECT "lsm_ls_validation" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`lsm_ls_validation` UNION 
SELECT "mds_all_hierarchies" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`mds_all_hierarchies` UNION 
SELECT "o_data_freshness" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdwdb`.`o_data_freshness` 



) A



where exact_row_count=0)B