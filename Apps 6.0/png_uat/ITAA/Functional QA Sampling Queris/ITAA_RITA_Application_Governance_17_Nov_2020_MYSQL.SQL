from      ldb.f_rita_application_c_fact      a11
                join        ldb.d_rita_application_c               a12
                  on         (a11.rita_application_c_key = a12.row_key)
                join        ldb.d_rita_application_ext_c      a13
                  on         (a12.rita_application_ext_c_key = a13.row_key)
                join        ldb.d_lov_processing_activities_ot_repository_type_c   a14
                  on         (a12.application_nature_c_key = a14.row_key)
                join        ldb.d_application_pg_asset_owner_c     a15
                  on         (a11.pg_asset_owner_c_key_c = a15.row_key)
                join        ldb.d_ea_request_item_c            a16
                  on         (a13.ea_request_item_c_key = a16.row_key)
                join        ldb.d_processing_activities_managing_organization_c   a17
                  on         (a11.managing_organization_c_key = a17.row_key)
                join        ldb.d_lov_irisk_compliant_c       a18
                  on         (a13.irisk_compliant_c_key = a18.row_key)
                join        ldb.d_lov_processing_activities_ot_life_cycle_status_c  a19
                  on         (a12.data_asset_lifecycle_status_key = a19.row_key)
                join        ldb.d_lov_mega_availability_rating_c     a110
                  on         (a12.pg_bia_availability_rating_c_key = a110.row_key)
                join        ldb.d_lov_mega_confident_rating_c       a111
                  on         (a12.pg_bia_confidentiality_rating_c_key = a111.row_key)
                join        ldb.d_lov_mega_integrity_rating_c         a112
                  on         (a12.pg_bia_rating_for_integrity_c_key = a112.row_key)
                join        ldb.d_application_data_classification_c a113
                  on         (a12.application_data_classification_c_key = a113.row_key)
                join        ldb.d_application_pg_data_privacy_c     a114
                  on         (a12.application_pg_data_privacy_c_key = a114.row_key)
                join        ldb.d_lvl1_organization_lead_c a115
                  on         (a17.lvl1_organization_c_key = a115.row_key)
                join        ldb.d_lvl2_organization_lead_c a116
                  on         (a17.lvl2_organization_c_key = a116.row_key)
                join        ldb.d_lvl3_organization_lead_c a117
                  on         (a17.lvl3_organization_c_key = a117.row_key)
                join        ldb.d_location   a118
                  on         (a15.location_key = a118.row_key)
                join        ldb.d_lov_mega_assessment_status_c   a119
                  on         (a12.pg_irisk_assessment_status_c_key = a119.row_key)
                join        ldb.d_lov_overall_rating_c          a120
                  on         (a13.pg_bia_rating_for_overall_c_key = a120.row_key)
                join        ldb.d_lov_mega_data_correct_c               a121
                  on         (a13.data_correct_c_key = a121.row_key)
                join        ldb.d_lov_mega_data_currentness_c     a122
                  on         (a13.data_currentness_c_key = a122.row_key)
                join        ldb.d_lov_mega_ea_data_compliance_c               a123
                  on         (a13.ea_data_compliance_c_key = a123.row_key)
                join        ldb.d_hosting_category_c            a124
                  on         (a13.hosting_category_c_key = a124.row_key)
                join        ldb.d_lov_rita_app_business_critical_c  a125
                  on         (a13.business_criticality_c = a125.row_key)
                join        ldb.d_lov_mega_registration_data_compliance_c            a126
                  on         (a13.registration_data_compliance_c_key = a126.row_key)
                join        ldb.d_lov_mega_registration_overall_compliance_c        a127
                  on         (a13.registration_overall_compliance_c_key = a127.row_key)
                join        ldb.d_lov_mega_validation_data_compliance_c a128
                  on         (a13.validation_data_compliance_c_key = a128.row_key)
                join        ldb.d_lov_application_pg_data_privacy_new_c a129
                  on         (a13.application_pg_data_privacy_new_c_key = a129.row_key)
                join        ldb.d_lov_irisk_assessment_status_c      a130
                  on         (a13.irisk_assessment_status_c_key = a130.row_key)
                join        ldb.d_lov_mega_irisk_compliance_c       a131
                  on         (a13.irisk_compliance_c_key = a131.row_key)
                join        ldb.d_internal_contact_request_item_architect_c            a132
                  on         (a16.architect_c_key = a132.row_key)
                join        ldb.d_lov_ea_request_item_approval_c a133
                  on         (a16.request_item_approval_c_key = a133.row_key)
where   (a14.cust_dimension_name_c in ('Application', 'Application Platform')
and a19.source_dimension_name in ('Design/Build', 'Discovery/Requ.', 'Exception', 'Leverage/Optimize', 'Launch/Deploy', 'Qualify/Deliver', 'Retired', 'Sunset', 'Undecided', 'UNSPECIFIED')
and a12.mega_hex not in ('0AB41C414EC4013D')
and a13.sys_class_name_c in ('cmdb_ci_appl'))
