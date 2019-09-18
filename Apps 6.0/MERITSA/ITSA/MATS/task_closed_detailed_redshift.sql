select 'ldb.f_task_c_closed_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_c_closed_c a11 
union
select 'ldb.d_master_item a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11

                join          ldb.d_master_item  a12

                  on          (a11.catalog_item_key = a12.row_key)
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  
				  
     join          ldb.d_internal_organization_group        a13

                  on          (a11.assignment_group_key = a13.row_key)
				  
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11					  

                join          ldb.d_calendar_date               a14

                  on          (a11.date_key_c = a14.row_key)
				  
	union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11	

	
 join ldb.d_calendar_date               a14

                  on          (a11.date_key_c = a14.row_key)
                join          ldb.d_calendar_month            a15

                  on          (a14.month_start_date_key = a15.row_key)
				  
	union
select 'ldb.d_calendar_quarter a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  
  
join
  ldb.d_calendar_date               a14

                  on          (a11.date_key_c = a14.row_key)
                join          ldb.d_calendar_month            a15

                  on          (a14.month_start_date_key = a15.row_key)
                join          ldb.d_calendar_quarter          a16

                  on          (a15.quarter_start_date_key = a16.row_key)
				  
				  
union
select 'ldb.d_task_ra_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11					  

                join          ldb.d_task_ra_c      a17

                  on          (a11.task_key = a17.row_key)
				  
				  
				  
				  
union
select 'ldb.d_calendar_week a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11					  
  join          ldb.d_calendar_date               a14

                  on          (a11.date_key_c = a14.row_key)
                join          ldb.d_calendar_week             a18

                  on          (a14.week_start_date_key = a18.row_key)
				  
				  
				  
				  
	union
select 'ldb.d_calendar_year a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  
join ldb.d_calendar_date               a14

                  on          (a11.date_key_c = a14.row_key)
                join          ldb.d_calendar_month            a15

                  on          (a14.month_start_date_key = a15.row_key)
                join          ldb.d_calendar_quarter          a16

                  on          (a15.quarter_start_date_key = a16.row_key)
                join          ldb.d_calendar_year              a19

                  on          (a16.year_start_date_key = a19.row_key)
				  
				  
				  
	union
select 'ldb.d_location a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  

                join          ldb.d_location         a110

                  on          (a11.location_key = a110.row_key)
				  
				  
	union
select 'ldb.d_task_parent_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  

                join          ldb.d_task_ra_c      a17

                  on          (a11.task_key = a17.row_key)
                join          ldb.d_task_parent_c               a111

                  on          (a17.parent_task_key = a111.row_key)
				  
				  
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11	
                join          ldb.d_internal_contact_assigned_to      a112

                  on          (a11.assigned_to_key = a112.row_key)
				  
union
select 'ldb.d_internal_organization_legalentity a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11					  

                join          ldb.d_internal_organization_legalentity                a113

                  on          (a11.company_key = a113.row_key)
				  
				  
	union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  

                join          ldb.d_configuration_item        a114

                  on          (a11.configuration_item_key = a114.row_key)
				  
	union
select 'ldb.d_lov_task_contacttype_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  
				  

                join          ldb.d_lov_task_contacttype_c               a115

                  on          (a11.contact_type_src_c_key = a115.row_key)
				  
	union
select 'ldb.d_lov_task_c_escalation_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  
				  

                join          ldb.d_lov_task_c_escalation_c             a116

                  on          (a11.escalation_c_key = a116.row_key)

				  
	union
select 'ldb.o_data_freshness a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  
				  
				  
                join          ldb.o_data_freshness             a117

                  on          (a11.source_id = a117.source_id)
				  
				  
	union
select 'ldb.d_lov_task_c_approval_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  
				  

                join          ldb.d_lov_task_c_approval_c                a118

                  on          (a11.approval_state_src_key = a118.row_key)
				  
				  
	union
select 'ldb.d_internal_contact_task_caller_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  
				  

                join          ldb.d_internal_contact_task_caller_c   a119

                  on          (a11.task_caller_c_key = a119.row_key)
				  
				  
	union
select 'ldb.d_internal_contact_task_closed_by_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  
				  

                join          ldb.d_internal_contact_task_closed_by_c            a120

                  on          (a11.closed_by_key = a120.row_key)
				  
				  
	union
select 'ldb.d_lov_task_impact_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  
				  

                join          ldb.d_lov_task_impact_c       a121

                  on          (a11.impact_src_key = a121.row_key)
				  
				  
				  
	union
select 'ldb.d_internal_contact_opened_by_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  

                join          ldb.d_internal_contact_opened_by_c    a122

                  on          (a11.opened_by_key = a122.row_key)
				  
				  
				  
				  
union
select 'ldb.d_lov_task_priority_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11	
                join          ldb.d_lov_task_priority_c      a123

                  on          (a11.priority_key = a123.row_key)
				  
	union
select 'ldb.d_lov_task_state_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  
				  

                join          ldb.d_lov_task_state_c          a124

                  on          (a11.state_src_key = a124.row_key)
				  
				  
		union
select 'ldb.d_lov_task_urgency_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11			  

                join          ldb.d_lov_task_urgency_c     a125

                  on          (a11.urgency_src_key = a125.row_key)
				  
	union
select 'ldb.d_internal_contact_org_manager_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from         ldb.f_task_c_closed_c            a11				  
				  
join          ldb.d_internal_organization_group        a13

                  on          (a11.assignment_group_key = a13.row_key)
                join          ldb.d_internal_contact_org_manager_c                a126

                  on          (a13.org_manager_c_key = a126.row_key)