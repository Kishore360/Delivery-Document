
update lsm_ls_dw_table_list set enable_flag ='N' where target_table_name in ('d_partner','f_sales_order_item','f_sales_contract_item','f_sales_order','d_sales_order','d_sales_contract','d_sales_contract_item','a_sales_order_item_monthly');

update lsm_ls_custom_measures_list set enable_flag='N' where subject_area='FIN' and table_seq_id>=512;

UPDATE lsm_ls_lov_metadata set is_mandatory='N' where dimension_class <>'NATURAL_ACCOUNT';
