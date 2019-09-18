select count(1)-- distinct  a11.assigned_to_key , a13.row_key
from      ldb.f_business_all_applcation_task_c     a11  -- 1291567
                join        ldb.d_business_application_c    a12
                  on         (a11.business_application_c_key = a12.row_key)
                 join    ldb.d_internal_contact_assigned_to       a13
                  on         (coalesce(a11.assigned_to_key,0) = coalesce(a13.row_key,0))
				 left outer join    ldb.d_calendar_date_opened_c a14
                  on         (a11.opened_on_key = a14.row_key)
				    join    ldb.d_outage     a15
                  on         (coalesce(a11.outage_key,0) =coalesce( a15.row_key,0))
				   join    ldb.d_outage_type         a16
                  on         (coalesce(a15.outage_type_src_key,0) = coalesce(a16.row_key,0))
				  join ldb.d_task a17 on (coalesce(a11.task_key,0)= coalesce(a17.row_key,0))
join    ldb.d_internal_organization_group         a122
                  on         (coalesce(a11.assignment_group_key,0) =coalesce( a122.row_key,0))
				  join    ldb.d_configuration_item            a123
                  on         (coalesce(a11.configuration_item_key,0) = coalesce(a123.row_key,0))
				  join    ldb.d_aetna_system_environments_c    a133
                  on         coalesce(a17.aetna_system_environments_c_key,0) = coalesce(a133.row_key,0)
                join    ldb.d_change_request_risk         a144
                  on         coalesce(a17.risk_src_key,0) = coalesce(a144.row_key,0)
                join    ldb.d_task_priority         a155
                  on         coalesce(a17.priority_src_key,0) = coalesce(a155.row_key,0)
                join    ldb.d_task_state              a166
                  on         coalesce(a17.state_src_key,0) = coalesce(a166.row_key,0)
                 join    ldb.d_task_type               a176
                  on         coalesce(a17.task_type_src_key,0) = coalesce(a176.row_key,0)
				  join    ldb.d_business_application_c    a129
                  on         coalesce(a11.business_application_c_key,0) = coalesce(a129.row_key,0)
				  join    ldb.d_configuration_item_task_ci_c        a128
                  on         (a11.configuration_item_key = a128.row_key)
				  join    ldb.d_lov_change_request_verification_method_c           a127
                  on         (a11.verification_method_src_c_key = a127.row_key)
				   join    ldb.d_application_linkage_c       a126
                  on         (a11.application_linkage_key  = a126.row_key)


				  
				  