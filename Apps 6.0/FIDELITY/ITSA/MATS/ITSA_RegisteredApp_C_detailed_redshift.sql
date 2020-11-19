select 'ldb."d_application_mdm" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
union
select 'ldb."d_fmr_product_c" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY)
union
select 'ldb."d_fmr_product_line_c" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY)
join "ldb"."d_fmr_product_line_c" a13
on (a12.fmr_product_line_c_key = a13.ROW_KEY)
union
select 'ldb."d_fmr_cost_center_c" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY) join "ldb"."d_fmr_product_line_c" a13
on (a12.fmr_product_line_c_key = a13.ROW_KEY)
join "ldb"."d_fmr_cost_center_c" a14
on (a13.cost_center_c_key = a14.ROW_KEY)
union
select 'ldb."d_fmr_business_unit_c" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY) join "ldb"."d_fmr_product_line_c" a13
on (a12.fmr_product_line_c_key = a13.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a14
on (a13.cost_center_c_key = a14.ROW_KEY)
join "ldb"."d_fmr_business_unit_c" a15
on (a14.fmr_business_unit_c_key = a15.ROW_KEY)
union
select 'ldb."d_fmr_business_group_c" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY) join "ldb"."d_fmr_product_line_c" a13
on (a12.fmr_product_line_c_key = a13.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a14
on (a13.cost_center_c_key = a14.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a15
on (a14.fmr_business_unit_c_key = a15.ROW_KEY)
join "ldb"."d_fmr_business_group_c" a16
on (a15.fmr_business_group_c_key = a16.ROW_KEY)
union
select 'ldb."d_internal_contact_business_service_manager_c" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY) join "ldb"."d_fmr_product_line_c" a13
on (a12.fmr_product_line_c_key = a13.ROW_KEY)
join "ldb"."d_internal_contact_business_service_manager_c" a17
on (a13.business_service_manager_c_key = a17.ROW_KEY)
union
select 'ldb."d_fmr_operating_committee_c" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY) join "ldb"."d_fmr_product_line_c" a13
on (a12.fmr_product_line_c_key = a13.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a14
on (a13.cost_center_c_key = a14.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a15
on (a14.fmr_business_unit_c_key = a15.ROW_KEY) join "ldb"."d_fmr_business_group_c" a16
on (a15.fmr_business_group_c_key = a16.ROW_KEY)
join "ldb"."d_fmr_operating_committee_c" a18
on (a16.fmr_operating_committee_c_key = a18.ROW_KEY)
union
select 'ldb."d_fmr_cio_group_c" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY) join "ldb"."d_fmr_product_line_c" a13
on (a12.fmr_product_line_c_key = a13.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a14
on (a13.cost_center_c_key = a14.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a15
on (a14.fmr_business_unit_c_key = a15.ROW_KEY) join "ldb"."d_fmr_business_group_c" a16
on (a15.fmr_business_group_c_key = a16.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a18
on (a16.fmr_operating_committee_c_key = a18.ROW_KEY)
join "ldb"."d_fmr_cio_group_c" a19
on (a18.fmr_cio_group_c_key = a19.ROW_KEY)
union
select 'ldb."d_internal_contact_service_offering_manager_c" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY)
join "ldb"."d_internal_contact_service_offering_manager_c" a110
on (a12.service_offering_manager_c_key = a110.ROW_KEY)
union
select 'ldb."d_lov_application_discoverable_c" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_lov_application_discoverable_c" a111
on (a11.application_discoverable_c_key = a111.ROW_KEY)
union
select 'ldb."d_lov_application_orgin_c" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_lov_application_orgin_c" a112
on (a11.application_orgin_c_key = a112.ROW_KEY)
union
select 'ldb."d_lov_application_database_replication_c" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_lov_application_database_replication_c" a113
on (a11.application_database_replication_c_key = a113.ROW_KEY)
union
select 'ldb."d_lov_application_discovery_status_c" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_lov_application_discovery_status_c" a114
on (a11.application_discovery_status_c_key = a114.ROW_KEY)
union
select 'ldb."d_lov_application_subtype_c" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_lov_application_subtype_c" a115
on (a11.application_subtype_c_key = a115.ROW_KEY)
union
select 'ldb."d_lov_application_lifecycle_stage_c" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_lov_application_lifecycle_stage_c" a116
on (a11.application_lifecycle_stage_c_key = a116.ROW_KEY)
union
select 'ldb."d_lov_application_recovery_architecture_c" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_lov_application_recovery_architecture_c" a117
on (a11.application_recovery_architecture_c_key = a117.ROW_KEY)
union
select 'ldb."d_lov_application_sourcecode_classification_c" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_lov_application_sourcecode_classification_c" a118
on (a11.application_sourcecode_classification_c_key = a118.ROW_KEY)
union
select 'ldb."d_lov_application_operational_status_c" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_lov_application_operational_status_c" a119
on (a11.application_operational_status_c_key = a119.ROW_KEY)
union
select 'ldb."d_lov_application_undiscoverable_reason_c" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_lov_application_undiscoverable_reason_c" a120
on (a11.application_undiscoverable_reason_c_key = a120.ROW_KEY)
union
select 'ldb."d_lov_product_install_status_src_c" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY)
join "ldb"."d_lov_product_install_status_src_c" a121
on (a12.product_install_status_src_c = a121.ROW_KEY)
union
select 'ldb."d_lov_install_status_src_c" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY) join "ldb"."d_fmr_product_line_c" a13
on (a12.fmr_product_line_c_key = a13.ROW_KEY)
join "ldb"."d_lov_install_status_src_c" a122
on (a13.install_status_src_c = a122.ROW_KEY)
union
select 'ldb."d_service_offering_manager_fmr_department_c" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY) join "ldb"."d_internal_contact_service_offering_manager_c" a110
on (a12.service_offering_manager_c_key = a110.ROW_KEY)
join "ldb"."d_service_offering_manager_fmr_department_c" a123
on (a110.fmr_business_unit_c_key = a123.ROW_KEY)
union
select 'ldb."d_business_service_manager_fmr_department_c" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY) join "ldb"."d_fmr_product_line_c" a13
on (a12.fmr_product_line_c_key = a13.ROW_KEY) join "ldb"."d_internal_contact_business_service_manager_c" a17
on (a13.business_service_manager_c_key = a17.ROW_KEY)
join "ldb"."d_business_service_manager_fmr_department_c" a124
on (a17.fmr_business_unit_c_key = a124.ROW_KEY)
union
select 'ldb."d_internal_contact_cio_user_c" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_mdm" a11
join "ldb"."d_fmr_product_c" a12
on (a11.fmr_product_c_key = a12.ROW_KEY) join "ldb"."d_fmr_product_line_c" a13
on (a12.fmr_product_line_c_key = a13.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a14
on (a13.cost_center_c_key = a14.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a15
on (a14.fmr_business_unit_c_key = a15.ROW_KEY) join "ldb"."d_fmr_business_group_c" a16
on (a15.fmr_business_group_c_key = a16.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a18
on (a16.fmr_operating_committee_c_key = a18.ROW_KEY) join "ldb"."d_fmr_cio_group_c" a19
on (a18.fmr_cio_group_c_key = a19.ROW_KEY)
join "ldb"."d_internal_contact_cio_user_c" a125
on (a19.cio_user_c_key = a125.ROW_KEY)