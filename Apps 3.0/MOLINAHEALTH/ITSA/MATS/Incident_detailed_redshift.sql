 select'f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 union
  select'd_incident_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join        ldb.d_incident   a110
                  on         (a11.incident_key = a110.row_key)
   join        ldb.d_incident_type_c  a134
                  on         (a110.incident_type_src_c_key = a134.row_key)
		union
 select'd_incident_outage_class_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join        ldb.d_incident   a110
                  on         (a11.incident_key = a110.row_key)
 				     join        ldb.d_incident_outage_class_c a136
                  on         (a110.outage_class_src_c_key = a136.row_key)
				  union
				   select'd_business_unit_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
   join        ldb.d_configuration_item            a19
                  on         (a11.configuration_item_key = a19.row_key)
 				  join        ldb.d_business_unit_c  a128
                  on         (a19.business_unit_c_key = a128.row_key)
				  union
				  select'd_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_organization_group       a115
on (a11.assignment_group_key = a115.row_key)
join ldb.d_internal_contact_manager_c       a116
on (a115.manager_c_key = a116.row_key)
  union
				  select'd_internal_organization_gp_depart_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_organization_group       a115
on (a11.assignment_group_key = a115.row_key)
join ldb.d_internal_organization_gp_depart_c       a116
on (a115.department_c_key = a116.row_key)
union
  select'd_internal_organization_gp_assignment_teams_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_organization_gp_assignment_teams_c       a116
on (a11.assignment_teams_c_key = a116.row_key)
union
 select'd_internal_contact_caller' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_contact_caller       a116
on (a11.caller_key = a116.row_key)
union
 select'd_internal_contact_communications_advisor_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_contact_communications_advisor_c       a116
on (a11.communications_advisor_c_key = a116.row_key)
union
 select'd_internal_contact_communications_lead_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 


join ldb.d_internal_contact_communications_lead_c       a116
on (a11.communications_lead_c_key = a116.row_key)
union
 select'd_internal_contact_communications_lead_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 


join ldb.d_internal_contact_communications_lead_c       a116
on (a11.communications_lead_c_key = a116.row_key)
union
  select'd_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 


join ldb.d_internal_contact_manager_c       a116
on (a11.incident_manager_c_key = a116.row_key)
union
 select'd_internal_contact_facilitator_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 


join ldb.d_internal_contact_facilitator_c       a116
on (a11.it_incident_facilitator_c_key = a116.row_key)
union
  select'd_internal_contact_service_owner_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 


join ldb.d_internal_contact_service_owner_c       a116
on (a11.service_owner_c_key = a116.row_key) 

union
select'd_lov_incident_ci_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join        ldb.d_incident   a110
                  on         (a11.incident_key = a110.row_key)
   join        ldb.d_lov_incident_ci_type_c  a134
                  on         (a110.ci_type_c_key = a134.row_key)
				  union
				  select'd_lov_incident_incident_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join        ldb.d_incident   a110
                  on         (a11.incident_key = a110.row_key)
   join        ldb.d_lov_incident_incident_category_c  a134
                  on         (a110.incident_category_c_key = a134.row_key)
				  union
				  			  select'd_lov_incident_incident_subcategory_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join        ldb.d_incident   a110
                  on         (a11.incident_key = a110.row_key)
   join        ldb.d_lov_incident_incident_subcategory_c  a134
                  on         (a110.incident_subcategory_c_key = a134.row_key)
				  union
				    select'd_internal_organization_incident_vendor_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
   join        ldb.d_internal_organization_incident_vendor_c  a134
                  on         (a11.vendor_c_key = a134.row_key)
				  
				  union
				  select'd_lov_incident_escalation_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join        ldb.d_incident   a110
                  on         (a11.incident_key = a110.row_key)
   join        ldb.d_lov_incident_escalation_c  a134
                  on         (a110.escalation_c_key = a134.row_key)
				  union
		select'd_lov_incident_outage_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join        ldb.d_incident   a110
                  on         (a11.incident_key = a110.row_key)
   join        ldb.d_lov_incident_outage_type_c  a134
                  on         (a110.outage_type_c_key = a134.row_key)			  
				  union
				  select'd_task_incident_parent_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
   join        ldb.d_task_incident_parent_c  a134
                  on         (a11.parent_c_key = a134.row_key)	
				  union
				  select'd_configuration_item_incident_so_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
   join        ldb.d_configuration_item_incident_so_c  a134
                  on         (a11.service_offering_c_key = a134.row_key)	
				  