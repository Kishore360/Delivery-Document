select dsv.name as "business service name", case when dsv.criticality is Null then 'UNSPECIFIED' else dsv.criticality end , 
used_for.source_dimension_name , dsv.version ,'' as metric ,
sum(case when dp.over_due_flag='Y' then 1 else 0 end) as " Overdue Problems",
concat(round(sum(case when dp.over_due_flag='Y' then 1 else 0 end)*100.00/count(fp.row_key),0),'%') as "Overdue Problems%",
sum(case when dp.priority_escalated_flag='Y' then 1 else 0 end) as "Priority Escated Problems",
trim(to_char(sum(case when dp.known_error_flag='Y' then 1 else 0 end),'999,999,990')) as "Known Errors"
from #DWH_TABLE_SCHEMA.f_problem fp
 join 
(SELECT d_service.soft_deleted_flag, d_service.warranty_expiry_date, d_service.source_id, d_service.start_date, d_service.created_by, d_service.criticality, d_service.row_dn_key, d_service."type", d_service.is_it_shared_service_flag, d_service."owner", d_service.category, d_service.subcategory, d_service.dw_inserted_on, d_service.row_current_key, d_service.criticality_key, d_service.created_on, d_service.etl_run_number, d_service.effective_to, d_service.cdctype, d_service.effective_from, d_service.name, d_service.version, d_service.order_date, d_service.manager, d_service.delivery_date, d_service.description, d_service.used_for_src_key, d_service.secondary2_changed_on, d_service.changed_by, d_service.install_date, d_service.is_business_service_flag, d_service.changed_on, d_service.secondary1_changed_on, d_service.install_status, d_service.row_key, d_service.row_id, d_service.used_for_src_code, d_service.dw_updated_on, d_service.current_flag
   FROM #DWH_TABLE_SCHEMA.d_service
  WHERE d_service.is_business_service_flag = 'Y'::bpchar OR d_service.row_key = 0 OR d_service.row_key = -1) dsv
on dsv.row_key =  fp.business_service_key 
join(
SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'CRITICALITY~BUSINESS_SERVICE'::text
UNION ALL 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) cr_bs
  on cr_bs.row_key= dsv.criticality_key
  join (
  SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'USED_FOR~BUSINESS_SERVICE'::text
UNION ALL 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) used_for
  on used_for.row_key = dsv.used_for_src_key
join #DWH_TABLE_SCHEMA.d_problem dp
on fp.problem_key = dp.row_key
 join 
(
SELECT d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) CAL
on cal.row_key = fp.opened_on_key
join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_mon
on CAL.month_start_date_key = cal_mon.row_key
where fp.soft_deleted_flag = 'N'
group by dsv.name , dsv.criticality, used_for.source_dimension_name, dsv.version
order by lower(dsv.name), lower(dsv.criticality), lower(used_for.source_dimension_name), lower(dsv.version)