select'ldb.f_sap_actuals_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_sap_actuals_c       a11 
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_sap_actuals_c       a11 
join ldb.d_calendar_date_fiscal       a12
on (a11.sap_posting_date_key = a12.row_key)
union
select'ldb.d_cost_element_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_sap_actuals_c       a11 
join ldb.d_cost_element_c       a13
on (a11.sap_cost_element_key = a13.row_key)
union
select'ldb.d_offsetting_account_number_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_sap_actuals_c       a11 
join ldb.d_offsetting_account_number_c       a14
on (a11.sap_offsetting_acount_key = a14.row_key)
union
select'ldb.d_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_sap_actuals_c       a11 
join ldb.d_project       a15
on (a11.sap_project_key = a15.row_key)
union
select'ldb.d_cap_ex_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_sap_actuals_c       a11 
join ldb.d_cap_ex_c       a16
on (a11.sap_capital_expense_key = a16.row_key)
union
select'ldb.d_spend_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_sap_actuals_c       a11 
join ldb.d_spend_category_c       a17
on (a11.sap_spend_category_key = a17.row_key)
union
select'ldb.d_offsetting_account_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_sap_actuals_c       a11 
join ldb.d_offsetting_account_type_c       a18
on (a11.sap_offsetting_account_type_key = a18.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_sap_actuals_c       a11 
join ldb.d_calendar_date       a19
on (a11.sap_document_date_key = a19.row_key)
union
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_sap_actuals_c       a11 
 join ldb.d_calendar_date_fiscal       a12
on (a11.sap_posting_date_key = a12.row_key)
join ldb.d_calendar_fiscal_period       a110
on (a12.period_start_date_key = a110.row_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_sap_actuals_c       a11 
 join ldb.d_calendar_date_fiscal       a12
on (a11.sap_posting_date_key = a12.row_key)
join ldb.d_calendar_fiscal_year       a111
on (a12.year_start_date_key = a111.row_key)

