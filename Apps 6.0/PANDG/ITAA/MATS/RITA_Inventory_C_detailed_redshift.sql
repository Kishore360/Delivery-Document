select 'ldb.f_pandg_ot_processing_activities_inventory_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
union
select'ldb.d_pandg_ot_processing_activities_inventory_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
union
select'ldb.d_lov_pa_breach_resp_stats_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11
join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_pa_breach_resp_stats_c       a13
on (a12.breach_resp_stats_c = a13.row_key)
union
select'ldb.d_lov_pa_priv_imp_asmt_stats_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_pa_priv_imp_asmt_stats_c       a14
on (a12.priv_imp_asmt_stats_c = a14.row_key)
union
select'ldb.d_lov_pa_ret_stats_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_pa_ret_stats_c       a15
on (a12.ret_stats_c = a15.row_key)
union
select'ldb.d_lov_pa_sub_rgt_stats_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_pa_sub_rgt_stats_c       a16
on (a12.sub_rgt_stats_c = a16.row_key)
union
select'ldb.d_lov_pa_inventory_stats_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_pa_inventory_stats_c       a17
on (a12.inventory_stats_c = a17.row_key)
union
select'ldb.d_lov_pa_law_basis_stats_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11
join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_pa_law_basis_stats_c       a18
on (a12.law_basis_stats_c = a18.row_key)
union
select'ldb.d_lov_pa_mini_stats_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_pa_mini_stats_c       a19
on (a12.mini_stats_c = a19.row_key)
union
select'ldb.d_lov_pa_notice_stats_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11
join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_pa_notice_stats_c       a110
on (a12.notice_stats_c = a110.row_key)
union
select'ldb.d_lov_pa_it_sec_ctrl_stats_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11
join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_pa_it_sec_ctrl_stats_c       a111
on (a12.it_sec_ctrl_stats_c = a111.row_key)
union
select'ldb.d_lov_pa_vendors_stats_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11
join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_pa_vendors_stats_c       a112
on (a12.vendors_stats_c = a112.row_key)
union
select'ldb.d_lov_processing_activities_ot_eu_data_stakeholders_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_eu_data_stakeholders_c       a116
on (a12.ot_eu_data_stakeholders_c_key = a116.row_key)
union
select'ldb.d_lov_processing_activities_ot_age_class_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_age_class_c       a117
on (a12.ot_age_class_c_key = a117.row_key)
union
select'ldb.d_lov_processing_activities_ot_life_cycle_status_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_life_cycle_status_c       a118
on (a12.ot_life_cycle_status_c_key = a118.row_key)
union
select'ldb.d_lov_processing_activities_ot_compliance_prioritization_two_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_compliance_prioritization_two_c       a119
on (a12.ot_compliance_priority2_c_key = a119.row_key)
union
select'ldb.d_lov_processing_activities_data_subject_type_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_data_subject_type_c       a120
on (a12.data_subject_type_c_key = a120.row_key)
union
select'ldb.d_lov_processing_activities_ot_pg_users_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11
join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_pg_users_c       a121
on (a12.ot_pg_users_c_key = a121.row_key)
union
select'ldb.d_lov_processing_activities_pii_data_type_final_formula_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_pii_data_type_final_formula_c       a122
on (a12.pii_data_type_final_formula_c_key = a122.row_key)
union
select'ldb.d_lov_processing_activities_ot_repository_sub_type_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_repository_sub_type_c       a123
on (a12.ot_repository_sub_type_c_key = a123.row_key)
union
select'ldb.d_lov_processing_activities_ot_repository_type_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_repository_type_c       a124
on (a12.ot_repository_type_c_key = a124.row_key)
union
select'ldb.d_lov_processing_activities_ot_scope_number_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_scope_number_c       a125
on (a12.ot_scope_number_c_key = a125.row_key)
union
select'ldb.d_lov_processing_activities_ot_third_party_users_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_third_party_users_c       a126
on (a12.ot_third_party_users_c_key = a126.row_key)
union
select'ldb.d_lov_processing_activities_vendor_qualification_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_vendor_qualification_c       a127
on (a12.vendor_qualification_c_key = a127.row_key)
union
select'ldb.d_lov_processing_activities_ot_volume_risk_level_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_volume_risk_level_c       a128
on (a12.ot_volume_risk_level_c_key = a128.row_key)
union
select'ldb.d_lov_processing_activities_ot_volume_of_records_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_volume_of_records_c       a129
on (a12.ot_volume_of_records_c_key = a129.row_key)
union
select'ldb.d_processing_activities_managing_organization_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
join ldb.d_processing_activities_managing_organization_c       a113
on (a11.managing_organization_c_key = a113.row_key)
union
select'ldb.d_processing_activities_owning_organization_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
join ldb.d_processing_activities_owning_organization_c       a114
on (a11.pandg_ot_organization_c_key = a114.row_key)
union
select'ldb.d_processing_activities_sap_vendor_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_pandg_ot_processing_activities_inventory_c       a11 
join ldb.d_processing_activities_sap_vendor_c       a115
on (a11.sap_vendor_c_key = a115.row_key)

