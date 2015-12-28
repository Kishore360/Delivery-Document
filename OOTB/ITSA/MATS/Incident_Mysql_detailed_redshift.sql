 select'f_incident_closed' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT f_incident.row_key
   FROM bhn_mdwdb.f_incident f_incident
   JOIN (SELECT lov.row_key, wh_lov.dimension_code AS wh_dimension_code
   FROM bhn_mdwdb.d_lov lov
   LEFT JOIN bhn_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN bhn_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION ALL 
 SELECT lov.row_key, lov.dimension_code AS wh_dimension_code
   FROM bhn_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) a12 ON f_incident.state_src_key = a12.row_key
  WHERE a12.wh_dimension_code = 'CLOSED' AND f_incident.soft_deleted_flag = 'N'

)            a11 
union
 select'f_incident_resolved' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT  f_incident.row_key
   FROM bhn_mdwdb.f_incident f_incident
   JOIN (SELECT lov.row_key, wh_lov.dimension_code AS wh_dimension_code
   FROM bhn_mdwdb.d_lov lov
   LEFT JOIN bhn_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN bhn_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION ALL 
 SELECT lov.row_key, lov.dimension_code AS wh_dimension_code
   FROM bhn_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) a12 ON f_incident.state_src_key = a12.row_key AND f_incident.soft_deleted_flag = 'N'
  WHERE a12.wh_dimension_code = 'RESOLVED' OR a12.wh_dimension_code = 'CLOSED'
)            a11 
 union
 select'f_incident' as Table_Name, count(a11.row_key) Row_Count
 from(
SELECT a.row_key,a.severity_src_key
   FROM bhn_mdwdb.f_incident a
     WHERE a.soft_deleted_flag = 'N')a11
union
 select'd_calendar_date_opened' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.opened_on_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join (SELECT d_calendar_date.row_key
   FROM bhn_mdwdb.d_calendar_date d_calendar_date
)        a12
on (a11.opened_on_key = a12.row_key)
union
select'd_calendar_time' as Table_Name, count(a11.row_key) Row_Count from
(SELECT a.row_key,a.opened_time_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join (select row_key from bhn_mdwdb.d_calendar_time )         a12
on (a11.opened_time_key = a12.row_key)
union
select'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from  (SELECT a.row_key,a.configuration_item_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join (select row_key from bhn_mdwdb.d_configuration_item )           a13
on (a11.configuration_item_key = a13.row_key)


union
select'd_domain' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.domain_key
   FROM bhn_mdwdb.f_incident a
     WHERE a.soft_deleted_flag = 'N')             a11 
join  (select row_key from bhn_mdwdb.d_domain )    a16
on (a11.domain_key = a16.row_key)
union
select'd_incident' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.incident_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  (select row_key from bhn_mdwdb.d_incident )      a17
on (a11.incident_key = a17.row_key)
union
select'd_internal_contact_assignment' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.assigned_to_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  (select row_key from bhn_mdwdb.d_internal_contact )      a123
on (a11.assigned_to_key = a123.row_key)




union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.opened_by_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  (select row_key from bhn_mdwdb.d_internal_contact)       a113
on (a11.opened_by_key = a113.row_key)



union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.location_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  (select row_key from bhn_mdwdb.d_location)       a117
on (a11.location_key = a117.row_key)
union

select'd_customer' as Table_Name, count(a11.row_key) Row_Count
from  (SELECT a.row_key,a.customer_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join ( SELECT d_organization_customer.row_key
   FROM bhn_mdwdb.d_organization_customer d_organization_customer
  WHERE d_organization_customer.row_key <> 0 AND d_organization_customer.row_key <> -1
UNION ALL 
 SELECT d_organization_customer.row_key
   FROM bhn_mdwdb.d_organization_customer d_organization_customer
  WHERE d_organization_customer.row_key = 0 OR d_organization_customer.row_key = -1 )           a14
on (a11.customer_key = a14.row_key)
union
select'd_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
from  (SELECT a.row_key,a.customer_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join ( SELECT d_organization_customer.row_key,row_current_key
   FROM bhn_mdwdb.d_organization_customer d_organization_customer
  WHERE d_organization_customer.row_key <> 0 AND d_organization_customer.row_key <> -1
UNION ALL 
 SELECT d_organization_customer.row_key,row_current_key
   FROM bhn_mdwdb.d_organization_customer d_organization_customer
  WHERE d_organization_customer.row_key = 0 OR d_organization_customer.row_key = -1 )           a14
on (a11.customer_key = a14.row_key)

union
select'd_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.category_src_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  ( SELECT lov.row_key  FROM bhn_mdwdb.d_lov lov
  WHERE lov.dimension_class = 'CATEGORY~INCIDENT' OR lov.row_key = -1 OR lov.row_key = 0  )      a18
on (a11.category_src_key = a18.row_key)
union
select'd_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.close_code_src_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  ( SELECT lov.row_key   FROM bhn_mdwdb.d_lov lov
  WHERE lov.dimension_class = 'CLOSE_CODE~INCIDENT' OR lov.row_key = -1 OR lov.row_key = 0
)       a19
on (a11.close_code_src_key = a19.row_key)
union


select'd_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.severity_src_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  (SELECT lov.row_key
   FROM bhn_mdwdb.d_lov lov
   LEFT JOIN bhn_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN bhn_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'SEVERITY~INCIDENT'
UNION ALL 
 SELECT lov.row_key
   FROM bhn_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0)       a110
on (a11.severity_src_key = a110.row_key)


union
select'd_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.state_src_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  ( SELECT lov.row_key
   FROM bhn_mdwdb.d_lov lov
   LEFT JOIN bhn_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN bhn_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION ALL 
 SELECT lov.row_key
   FROM bhn_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0)       a111
on (a11.state_src_key = a111.row_key)
union
select'd_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.sub_category_src_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11  
join  (SELECT distinct lov.row_key 
   FROM bhn_mdwdb.d_lov lov
   LEFT JOIN bhn_mdwdb.d_lov parent ON parent.source_id = lov.source_id AND parent.dimension_class = 'CATEGORY~INCIDENT' AND parent.src_rowid = (('CATEGORY~INCIDENT' || '~~~') || upper(lov.dimension_type))
  WHERE lov.dimension_class = 'SUBCATEGORY~INCIDENT'
UNION ALL 
 SELECT distinct lov.row_key 
   FROM bhn_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0  )     a112
on (a11.sub_category_src_key = a112.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.opened_by_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  (select row_key,row_current_key from bhn_mdwdb.d_internal_contact)       a113
on (a11.opened_by_key = a113.row_key)
join  ( SELECT  d_internal_contact.row_current_key
   FROM bhn_mdwdb.d_internal_contact
  WHERE d_internal_contact.current_flag = 'Y'
)       a114
on (a113.row_current_key = a114.row_current_key)
union
select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.opened_by_department_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  ( SELECT  d_internal_organization.row_key
   FROM bhn_mdwdb.d_internal_organization
  WHERE d_internal_organization.department_flag = 'Y' OR d_internal_organization.row_key = 0 OR
 d_internal_organization.row_key = -1


 )      a115
on (a11.opened_by_department_key = a115.row_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.assignment_group_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  ( SELECT  d_internal_organization.row_key
   FROM bhn_mdwdb.d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y' OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1 )      a115
on (a11.assignment_group_key = a115.row_key)
union
select'd_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.company_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  ( SELECT  d_internal_organization.row_key
   FROM bhn_mdwdb.d_internal_organization
  WHERE d_internal_organization.legal_entity_flag = 'Y' OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1
)       a116
on (a11.company_key = a116.row_key)
union
select'd_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.reported_type_src_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  (SELECT lov.row_key
   FROM bhn_mdwdb.d_lov lov
  WHERE lov.dimension_class = 'CONTACT_TYPE~TASK'
UNION 
 SELECT lov.row_key
   FROM bhn_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0 )      a118
on (a11.reported_type_src_key = a118.row_key)
union
select'd_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.impact_src_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  (SELECT lov.row_key
   FROM bhn_mdwdb.d_lov lov
   LEFT JOIN bhn_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN bhn_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'IMPACT~TASK'
UNION 
 SELECT lov.row_key   FROM bhn_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0  )    a119
on (a11.impact_src_key = a119.row_key)
union
select'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.priority_src_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  (SELECT lov.row_key
   FROM bhn_mdwdb.d_lov lov
   LEFT JOIN bhn_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN bhn_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~TASK'
UNION 
 SELECT lov.row_key
   FROM bhn_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0  )    a120
on (a11.priority_src_key = a120.row_key)
union
select'd_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.urgency_src_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  ( SELECT lov.row_key
   FROM bhn_mdwdb.d_lov lov
   LEFT JOIN bhn_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN bhn_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'URGENCY~TASK'
UNION 
 SELECT lov.row_key
   FROM bhn_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0)      a121
on (a11.urgency_src_key = a121.row_key)
union
select'dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.assignment_group_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  (SELECT d_h_all_hierarchies.lev_0_key AS user_group_tier_key
   FROM bhn_mdwdb.d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class = 'ASSIGNMENT GROUP TIER' OR d_h_all_hierarchies.hierarchy_class = 'UNSPECIFIED' OR d_h_all_hierarchies.hierarchy_class = 'UNKNOWN') AND d_h_all_hierarchies.current_flag = 'Y' )     a122
on (a11.assignment_group_key = a122.user_group_tier_key)
union
select'dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  (SELECT a.row_key,a.assignment_group_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join  (SELECT d_h_all_hierarchies.lev_0_key AS user_group_type_key
   FROM bhn_mdwdb.d_h_all_hierarchies d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class = 'ASSIGNMENT GROUP TYPE' OR d_h_all_hierarchies.hierarchy_class = 'UNSPECIFIED' OR d_h_all_hierarchies.hierarchy_class = 'UNKNOWN') AND d_h_all_hierarchies.current_flag = 'Y'


 )      a122
on (a11.assignment_group_key = a122.user_group_type_key)


 union
 select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
  from  (SELECT a.row_key,a.opened_on_key
   FROM bhn_mdwdb.f_incident a
  WHERE a.soft_deleted_flag = 'N')             a11 
join   (SELECT d_calendar_date.row_key,d_calendar_date.month_start_date_key
   FROM bhn_mdwdb.d_calendar_date d_calendar_date
   
) a12
on (a11.opened_on_key = a12.row_key)
join  (SELECT d_calendar_date.row_key
   FROM bhn_mdwdb.d_calendar_date d_calendar_date
    where d_calendar_date.source_id = 0
 )       a124
on (a12.month_start_date_key = a124.row_key)
