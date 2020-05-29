select dv1.dimension_name as "Impact", dv2.dimension_name as "Priority"  ,--dv3.dimension_name as "Urgency" ,
dv3.dimension_name,
'' as metric,trim(to_char (count(fi.row_key),'999,999,990')) as "opened_incidents"
from#DWH_TABLE_SCHEMA.f_incident fi
left join#DWH_TABLE_SCHEMA.d_incident inc
on inc.row_key = fi.incident_key
left join#DWH_TABLE_SCHEMA.d_problem di
on fi.incident_key = di.row_key
left join#DWH_TABLE_SCHEMA.d_lov dv1
on fi.impact_src_key = dv1.row_key
left join#DWH_TABLE_SCHEMA.d_lov dv2
on fi.priority_src_key = dv2.row_key
left join#DWH_TABLE_SCHEMA.d_lov dv3
on fi.urgency_src_key = dv3.row_key
join 
(
SELECT d_calendar_date.*
   FROM#DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN#DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN#DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN#DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN#DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN#DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) CAL
on fi.opened_on_key = CAL.row_key
join 
(
select d_calendar_date.*
FROM#DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN#DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN#DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN#DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_mon
on cal.month_start_date_key = cal_mon.row_key
join 
  (SELECT d_organization_customer.row_key, d_organization_customer.row_dn_key, d_organization_customer.row_current_key, 'ORG_CUST' AS "class", concat('ORG_CUST~'::text, d_organization_customer.row_id::text)::character varying AS row_id, d_organization_customer.source_id, d_organization_customer.etl_run_number, d_organization_customer.customer_number AS party_id, d_organization_customer.parent_row_id, NULL::"unknown" AS title, NULL::"unknown" AS first_name, NULL::"unknown" AS middle_name, NULL::"unknown" AS last_name, d_organization_customer.organization_name AS name, d_organization_customer.st_address1, d_organization_customer.st_address2, d_organization_customer.st_address3, d_organization_customer.st_address4, d_organization_customer.city_code, d_organization_customer.state_code, d_organization_customer.postal_code, d_organization_customer.country_code, d_organization_customer.email_address, NULL::"unknown" AS mobile_number, d_organization_customer.work_phone, d_organization_customer.fax_number, NULL::"unknown" AS pager_number, d_organization_customer.organization_active_flag AS active_flag, d_organization_customer.preferred_language, d_organization_customer.credit_score, d_organization_customer.customer_since_date, NULL::"unknown" AS professional_title, d_organization_customer.soft_deleted_flag, d_organization_customer.created_by, d_organization_customer.changed_by, d_organization_customer.created_on, d_organization_customer.changed_on, d_organization_customer.current_flag, d_organization_customer.effective_from, d_organization_customer.effective_to, d_organization_customer.dw_inserted_on, d_organization_customer.dw_updated_on, d_organization_customer.enduser_flag, d_organization_customer.reseller_flag, d_organization_customer.distributor_flag, d_organization_customer.customer_contact1_name, d_organization_customer.customer_contact2_name, d_organization_customer.customer_contact3_name, d_organization_customer.renewalstatus, wh.wh_dim_code AS renewalstatus_wh_code
   FROM#DWH_TABLE_SCHEMA.d_organization_customer d_organization_customer
   LEFT JOIN ldb.d_customer_temp wh ON d_organization_customer.renewalstatus::text = wh.src_dim_code::text
  WHERE d_organization_customer.row_key <> 0 AND d_organization_customer.row_key <> -1
UNION ALL 
 SELECT d_organization_customer.row_key, d_organization_customer.row_dn_key, d_organization_customer.row_current_key, 'ORG_CUST' AS "class", concat('ORG_CUST~'::text, d_organization_customer.row_id::text)::character varying AS row_id, d_organization_customer.source_id, d_organization_customer.etl_run_number, d_organization_customer.customer_number AS party_id, d_organization_customer.parent_row_id, NULL::"unknown" AS title, NULL::"unknown" AS first_name, NULL::"unknown" AS middle_name, NULL::"unknown" AS last_name, d_organization_customer.organization_name AS name, d_organization_customer.st_address1, d_organization_customer.st_address2, d_organization_customer.st_address3, d_organization_customer.st_address4, d_organization_customer.city_code, d_organization_customer.state_code, d_organization_customer.postal_code, d_organization_customer.country_code, d_organization_customer.email_address, NULL::"unknown" AS mobile_number, d_organization_customer.work_phone, d_organization_customer.fax_number, NULL::"unknown" AS pager_number, d_organization_customer.organization_active_flag AS active_flag, d_organization_customer.preferred_language, d_organization_customer.credit_score, d_organization_customer.customer_since_date, NULL::"unknown" AS professional_title, d_organization_customer.soft_deleted_flag, d_organization_customer.created_by, d_organization_customer.changed_by, d_organization_customer.created_on, d_organization_customer.changed_on, d_organization_customer.current_flag, d_organization_customer.effective_from, d_organization_customer.effective_to, d_organization_customer.dw_inserted_on, d_organization_customer.dw_updated_on, d_organization_customer.enduser_flag, d_organization_customer.reseller_flag, d_organization_customer.distributor_flag, d_organization_customer.customer_contact1_name, d_organization_customer.customer_contact2_name, d_organization_customer.customer_contact3_name, d_organization_customer.renewalstatus, d_organization_customer.renewalstatus AS renewalstatus_wh_code
   FROM#DWH_TABLE_SCHEMA.d_organization_customer d_organization_customer
  WHERE d_organization_customer.row_key = 0 OR d_organization_customer.row_key = -1) dcu
on fi.customer_key = dcu.row_key
join(
SELECT lov.*, wh_lov.dimension_code AS state_code, wh_lov.dimension_name AS state
   FROM#DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN#DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN#DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION ALL 
 SELECT lov.*, lov.dimension_code AS state_code, lov.dimension_name AS state
   FROM#DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) inc_state
  on inc_state.row_key = fi.state_src_key
  join(
  SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM#DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN#DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN#DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'IMPACT~INCIDENT'::text
UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM#DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) inc_imp
  on inc_imp.row_key = fi.impact_src_key
  join (
  SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name, lov.lower_range_value
   FROM#DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN#DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN#DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'PRIORITY~INCIDENT'::text
UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name, 0 AS lower_range_value
   FROM#DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0)inc_pri
  on inc_pri.row_key = fi.priority_src_key
  join (
  SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM#DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN#DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN#DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'URGENCY~INCIDENT'::text
UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM#DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) inc_urg
  on inc_urg.row_key = fi.urgency_src_key
  join (
  SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name
   FROM#DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.dimension_class::text = 'CATEGORY~INCIDENT'::text OR lov.row_key = -1 OR lov.row_key = 0) inc_cat
  on inc_cat.row_key= fi.category_src_key
 where cal_mon.lagging_count_of_month between 0 and 12
and fi.soft_deleted_flag ='N'
group by dv1.dimension_name ,dv2.dimension_name ,dv3.dimension_name
order by lower(dv1.dimension_name) ,lower(dv2.dimension_name),lower(dv3.dimension_name) asc
