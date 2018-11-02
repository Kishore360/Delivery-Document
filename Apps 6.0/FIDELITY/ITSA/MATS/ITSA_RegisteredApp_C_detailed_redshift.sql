select 'ldb.d_application a12 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
union
select 'ldb.d_fmr_product_c a13 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 

join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) 
union
select 'ldb.d_fmr_product_line_c a14 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) 
join ldb.d_fmr_product_line_c a14 
on (a13.fmr_product_line_c_key = a14.row_key) 
union
select 'ldb.d_fmr_cost_center_c a15 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) join ldb.d_fmr_product_line_c a14 
on (a13.fmr_product_line_c_key = a14.row_key) 
join ldb.d_fmr_cost_center_c a15 
on (a14.cost_center_c_key = a15.row_key) 
union
select 'ldb.d_fmr_business_unit_c a16 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) join ldb.d_fmr_product_line_c a14 
on (a13.fmr_product_line_c_key = a14.row_key) join ldb.d_fmr_cost_center_c a15 
on (a14.cost_center_c_key = a15.row_key) 
join ldb.d_fmr_business_unit_c a16 
on (a15.fmr_business_unit_c_key = a16.row_key) 
union
select 'ldb.d_fmr_business_group_c a17 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) join ldb.d_fmr_product_line_c a14 
on (a13.fmr_product_line_c_key = a14.row_key) join ldb.d_fmr_cost_center_c a15 
on (a14.cost_center_c_key = a15.row_key) join ldb.d_fmr_business_unit_c a16 
on (a15.fmr_business_unit_c_key = a16.row_key) 
join ldb.d_fmr_business_group_c a17 
on (a16.fmr_business_group_c_key = a17.row_key) 
union
select 'ldb.d_internal_contact_business_service_manager_c a18 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) join ldb.d_fmr_product_line_c a14 
on (a13.fmr_product_line_c_key = a14.row_key) 
join ldb.d_internal_contact_business_service_manager_c a18 
on (a14.business_service_manager_c_key = a18.row_key) 
union
select 'ldb.d_internal_organization_business_service_manager_department_c a19 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) join ldb.d_fmr_product_line_c a14 
on (a13.fmr_product_line_c_key = a14.row_key) join ldb.d_internal_contact_business_service_manager_c a18 
on (a14.business_service_manager_c_key = a18.row_key) 
join ldb.d_internal_organization_business_service_manager_department_c a19 
on (a18.department_key = a19.row_key) 
union
select 'ldb.d_fmr_operating_committee_c a120 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) join ldb.d_fmr_product_line_c a14 
on (a13.fmr_product_line_c_key = a14.row_key) join ldb.d_fmr_cost_center_c a15 
on (a14.cost_center_c_key = a15.row_key) join ldb.d_fmr_business_unit_c a16 
on (a15.fmr_business_unit_c_key = a16.row_key) join ldb.d_fmr_business_group_c a17 
on (a16.fmr_business_group_c_key = a17.row_key) 
join ldb.d_fmr_operating_committee_c a120 
on (a17.fmr_operating_committee_c_key = a120.row_key) 
union
select 'ldb.d_fmr_cio_group_c a121 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) join ldb.d_fmr_product_line_c a14 
on (a13.fmr_product_line_c_key = a14.row_key) join ldb.d_fmr_cost_center_c a15 
on (a14.cost_center_c_key = a15.row_key) join ldb.d_fmr_business_unit_c a16 
on (a15.fmr_business_unit_c_key = a16.row_key) join ldb.d_fmr_business_group_c a17 
on (a16.fmr_business_group_c_key = a17.row_key) join ldb.d_fmr_operating_committee_c a120 
on (a17.fmr_operating_committee_c_key = a120.row_key) 
join ldb.d_fmr_cio_group_c a121 
on (a120.fmr_cio_group_c_key = a121.row_key) 
union
select 'ldb.d_internal_contact_service_offering_manager_c a122 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) 
join ldb.d_internal_contact_service_offering_manager_c a122 
on (a13.service_offering_manager_c_key = a122.row_key) 
union
select 'ldb.d_internal_organization_service_offering_manager_department_c a123 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) join ldb.d_internal_contact_service_offering_manager_c a122 
on (a13.service_offering_manager_c_key = a122.row_key) 
join ldb.d_internal_organization_service_offering_manager_department_c a123 
on (a122.department_key = a123.row_key) 
union
select 'ldb.d_lov_application_discoverable_c a124 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 

join ldb.d_lov_application_discoverable_c a124 
on (a12.application_discoverable_c_key = a124.row_key) 
union
select 'ldb.d_lov_application_database_replication_c a125 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 

join ldb.d_lov_application_database_replication_c a125 
on (a12.application_database_replication_c_key = a125.row_key) 
union
select 'ldb.d_lov_application_subtype_c a126 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 

join ldb.d_lov_application_subtype_c a126 
on (a12.application_subtype_c_key = a126.row_key) 
union
select 'ldb.d_lov_application_lifecycle_stage_c a127 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 

join ldb.d_lov_application_lifecycle_stage_c a127 
on (a12.application_lifecycle_stage_c_key = a127.row_key) 
union
select 'ldb.d_lov_product_install_status_src_c a128 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) 
join ldb.d_lov_product_install_status_src_c a128 
on (a13.product_install_status_src_c = a128.row_key) 
union
select 'ldb.d_lov_application_recovery_architecture_c a129 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 

join ldb.d_lov_application_recovery_architecture_c a129 
on (a12.application_recovery_architecture_c_key = a129.row_key) 
union
select 'ldb.d_lov_application_sourcecode_classification_c a120 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 

join ldb.d_lov_application_sourcecode_classification_c a120 
on (a12.application_sourcecode_classification_c_key = a120.row_key) 
union
select 'ldb.d_lov_application_operational_status_c a121 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 

join ldb.d_lov_application_operational_status_c a121 
on (a12.application_operational_status_c_key = a121.row_key) 
union
select 'ldb.d_lov_application_undiscoverable_reason_c a122 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 

join ldb.d_lov_application_undiscoverable_reason_c a122 
on (a12.application_undiscoverable_reason_c_key = a122.row_key) 
union
select 'ldb.d_lov_install_status_src_c a123 ' as Table_name, count(a12.row_key) Row_Count
from ldb.d_application a12 
join ldb.d_fmr_product_c a13 
on (a12.fmr_product_c_key = a13.row_key) join ldb.d_fmr_product_line_c a14 
on (a13.fmr_product_line_c_key = a14.row_key) 
join ldb.d_lov_install_status_src_c a123 
on (a14.install_status_src_c = a123.row_key) 
