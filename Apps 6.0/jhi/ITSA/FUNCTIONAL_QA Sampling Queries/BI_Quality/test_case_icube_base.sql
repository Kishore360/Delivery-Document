drop table if exists #DWH_TABLE_SCHEMA.test_case_icube_base ;
create table #DWH_TABLE_SCHEMA.test_case_icube_base AS

select 
d.row_key
,type.typ
,PRJ.project_name  as Application_Module
,d.work_item_number as TC_number
,d_wi_parent.work_item_number as TC_parent
,d.description as TC_title
,d.short_description as TC_short_description
,ITR.name as last_iteration
,ITR.row_key as last_iteration_key
,status.wi_sts as TC_status
,priority.pri as TC_priority
,type.typ as wi_type
,d.work_item_updated_on as TC_updated_on
,updt_by.user_name as TC_updated_by
,cred_by.user_name as TC_createdby 
,cred_by.full_name as TC_createdby_full
,d.created_on as TC_created_on
,f.soft_deleted_flag
-- Metrics --
,d.tc_automated_flag 
,d.tc_is_executed_flag
,d.tc_defects_created_flag,
case when d.tc_is_executed_flag = 'Y' then 1 else 0 end as executed_tc,
case when d.row_key is not null then 1 else 0 end as created_tc,
case when d.tc_is_executed_flag = 'N' then 1 else 0 end as not_executed_tc,
case when d.tc_defects_created_flag = 'Y' then 1 else 0 end tc_defect_link,
case when d.tc_automated_flag = 'Y' then 1 else 0 end as automated_tc,
case when d.tc_automated_flag = 'N' then 1 else 0 end as not_automated_tc

-- count(case when d.tc_defects_created_flag = 'Y' then d.row_key else null end)/count(d.row_key) as TC_Effectiveness,
-- count(case when d.tc_automated_flag = 'Y' then d.row_key else null end) / count(d.row_key) as Automation_%,
-- count(case when d.tc_is_executed_flag = 'Y' then d.row_key else null end/count(d.row_key) as %_of_executed_TCs


from #DWH_TABLE_SCHEMA.f_work_item f 
join #DWH_TABLE_SCHEMA.d_work_item  d
on f.work_item_key = d.row_key and f.soft_deleted_flag <> 'Y' 
left join #DWH_TABLE_SCHEMA.d_work_item d_wi_parent
on d.row_key = d_wi_parent.parent_work_item_key 
join #DWH_TABLE_SCHEMA.d_project PRJ
on PRJ.row_key = d.project_key
join #DWH_TABLE_SCHEMA.d_iteration ITR
on ITR.row_key = d.iteration_key
join #DWH_TABLE_SCHEMA.d_internal_contact cred_by
on cred_by.row_key = d.created_by_key 
join #DWH_TABLE_SCHEMA.d_internal_contact updt_by
on updt_by.row_key = d.work_item_updated_by_key
join 
(
 SELECT lov.*, wh_lov.dimension_code AS sts_code, wh_lov.dimension_name AS pri, lov.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS sts_code, lov.dimension_name AS sts, lov.dimension_name AS sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) priority
on priority.row_key = d.work_item_priority_src_key
join 
(
 SELECT lov.*, wh_lov.dimension_code AS sts_code, wh_lov.dimension_name AS wi_sts, lov.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATUS~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS sts_code, lov.dimension_name AS type, lov.dimension_name AS sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) status
on status.row_key = d.work_item_status_src_key
join 
(
 SELECT lov.*, wh_lov.dimension_code AS sts_code, wh_lov.dimension_name AS typ, lov.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'TYPE~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS sts_code, lov.dimension_name AS type, lov.dimension_name AS sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) type
on type.row_key = d.work_item_type_src_key
join
(
 SELECT lov.*, wh_lov.dimension_code AS wi_res_code, wh_lov.dimension_name AS wi_res, lov.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key AND br.dimension_class = 'RESOLUTION~WORK_ITEM'
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
   where lov.dimension_class = 'RESOLUTION~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_res_code, lov.dimension_name AS wi_res, lov.dimension_name AS sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) resolution
on resolution.row_key = D.work_item_resolution_src_key
-- created month
left join #DWH_TABLE_SCHEMA.d_calendar_date cal_crtd
on cal_crtd.row_key = f.created_on_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal_crtd_mon
on cal_crtd.month_start_date_key = cal_crtd_mon.row_key
-- completed month
left join #DWH_TABLE_SCHEMA.d_calendar_date cal_cmptd
on cal_cmptd.row_key = f.completed_on_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal_cmptd_mon
on cal_cmptd.month_start_date_key = cal_cmptd_mon.row_key
-- Resolved month
left join #DWH_TABLE_SCHEMA.d_calendar_date cal_rslvd
on cal_rslvd.row_key = coalesce(f.work_item_resolved_on_key,f.completed_on_key)
left join #DWH_TABLE_SCHEMA.d_calendar_date cal_rslvd_mon
on cal_rslvd.month_start_date_key = cal_rslvd_mon.row_key
-- inprogress month
left join #DWH_TABLE_SCHEMA.d_calendar_date cal_inprog
on cal_inprog.row_key = F.work_item_work_start_on_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal_inprog_mon
on cal_inprog.month_start_date_key = cal_inprog_mon.row_key
-- cancelled month
left join #DWH_TABLE_SCHEMA.d_calendar_date cal_cancld
on cal_cancld.row_key = f.completed_on_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal_cancld_mon
on cal_cancld.month_start_date_key = cal_cancld_mon.row_key
where  type.typ = 'TEST CASE' and ((cal_crtd_mon.lagging_count_of_month between 0 and 12 or 
        cal_inprog_mon.lagging_count_of_month between 0 and 12 or 
        cal_cmptd_mon.lagging_count_of_month between 0 and 12 or 
        cal_rslvd_mon.lagging_count_of_month between 0 and 12 or 
        cal_cancld_mon.lagging_count_of_month between 0 and 12) or
status.wi_sts = 'PROPOSED' or status.wi_sts = 'IN PROGRESS'  )