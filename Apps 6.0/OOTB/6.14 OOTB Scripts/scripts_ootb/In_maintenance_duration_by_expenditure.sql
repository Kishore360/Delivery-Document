

select
-- loc.dimension_name as asset_class,
lov_exp.dimension_name as expenditure_type, 
to_char(count(case when stat_his.current_flag='Y' then f.row_key else null end ),'FM999,999') as no_assets
/*,

case when round(( sum(case when stat_his.current_flag='Y'and  lom.dimension_wh_code = 'In Maintenance'  then f.cost_doc_amount else 0 end ) ),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round(((sum(case when stat_his.current_flag='Y' and lom.dimension_wh_code = 'In Maintenance' then f.cost_doc_amount else 0 end ))/1000),0),0), '9,999,999,990')),'K')) 
else concat('$',(trim(to_char(coalesce(round((sum(case when stat_his.current_flag='Y' and  lom.dimension_wh_code = 'In Maintenance' then f.cost_doc_amount else 0 end ))),0), '9,999,999,990')))) end
as instock_asset_cost */
,sum(case when stat_his.current_flag='Y'and  lom.dimension_wh_code = 'In Maintenance'   then 1 else 0 end ) as inmain_asset_count
,sum(case when lom.dimension_wh_code = 'In Maintenance'   then 1 else 0 end ) as inmain_asset_count
/*,round((sum(case when   stat_his.current_flag='Y'and lom.dimension_wh_code = 'In Maintenance'  then 1 else 0 end )::decimal(10,1)/
sum(case when stat_his.current_flag='Y'and  lom.dimension_wh_code in ('In Use', 'In Stock', 'In Maintenance', 'In Transit') then 1 else null end )::decimal(10,1))*100,1)  as in_stock_ratio

,
to_char(sum(case when lom.dimension_wh_code = 'In Maintenance'  then datediff(day,status_start_on,status_end_on)
else 0 end),'FM999,990.0')  as instock_asset_duration_days
*/
,to_char(round((sum(case when lom.dimension_wh_code = 'In Maintenance'  then datediff(day,status_start_on,status_end_on)
else 0 end))/count(case when stat_his.current_flag='Y' then f.row_key else null end )::decimal(22,10) ,1),'FM999,990.0')  as avg_inmain_asset_duration_days
,to_char(round((sum(case when lom.dimension_wh_code in ('In Maintenance','In Stock')  then datediff(day,status_start_on,status_end_on)
else 0 end))/count(case when stat_his.current_flag='Y' then f.row_key else null end )::decimal(22,10) ,1),'FM999,990.0')  as avg_inmain_in_stock_asset_duration_days

, round ((sum( case when stat_his.current_flag='Y' then f.asset_age else null end )/count(case when stat_his.current_flag='Y' then f.row_key else null end )) ,1) as asset_age
,
round (((sum(case when lom.dimension_wh_code = 'In Maintenance'  then datediff(day,status_start_on,status_end_on)
else 0 end))/ (sum( case when stat_his.current_flag='Y' then f.asset_age else null end )::decimal(22,10)))*100 ,1)||'%' as avg_in_main_time_ratio
from #DWH_TABLE_SCHEMA.d_asset d
inner join #DWH_TABLE_SCHEMA.f_asset f
on d.row_key=f.asset_key
and f.soft_deleted_flag<>'Y'
 
 
 join #DWH_TABLE_SCHEMA.d_internal_contact int_emp
 on  (f.asset_assigned_to_key = int_emp.row_key)
  join #DWH_TABLE_SCHEMA.d_internal_organization int_org
 on  (f.department_key = int_org.row_key)
 join (  
   select asset_key, asset_status_key,asset_substatus_key-- ,duration
 -- ,sum(datediff(day,status_start_on,status_end_on)) as s
  , status_start_on,status_end_on,current_flag
   FROM #DWH_TABLE_SCHEMA.f_asset_status_history
  WHERE f_asset_status_history.soft_deleted_flag = 'N'::bpchar
  )stat_his
  on f.asset_key=stat_his.asset_key
  
  join 
 (select lo.* from #DWH_TABLE_SCHEMA.d_lov lo
 where
 (lo.dimension_class::text = 'ASSET'::text AND lo.dimension_type::text = 'SUBSTATUS'::text)
 or lo.row_key in (0,-1)
 )lov_substatus
 on stat_his.asset_substatus_key=lov_substatus.row_key
 join 
 (select lo.* from #DWH_TABLE_SCHEMA.d_lov lo
 where
 (lo.dimension_class::text = 'ASSET'::text AND lo.dimension_type::text = 'STATUS'::text)
 or lo.row_key in (0,-1)
 )lov_status
 on stat_his.asset_status_key=lov_status.row_key 
 

 
  join #DWH_TABLE_SCHEMA.d_lov_map lom
 on lov_status.row_key=lom.src_key
 
   join 
 (select lo.* from #DWH_TABLE_SCHEMA.d_lov lo
 where
 (lo.dimension_class::text = 'ASSET'::text AND lo.dimension_type::text = 'EXPENDITURE_TYPE'::text)
 or lo.row_key in (0,-1)
 )lov_exp
 on d.expenditure_type_key=lov_exp.row_key
 
  join #DWH_TABLE_SCHEMA.d_asset_class dcn
 on d.asset_class_key=dcn.row_key
  left join 
  (select map.row_key as class_key,map.dimension_code as code1,lov.* from #DWH_TABLE_SCHEMA.d_lov_map map 
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov lov 
   ON map.wh_rowid::text = lov.row_id::text
 )loc

 on dcn.asset_class_name=loc.code1 

 -- and( lom.dimension_wh_code in ('In Use', 'In Maintenance', 'In Maintenance', 'In Transit'))
group by lov_exp.dimension_name-- ,loc.dimension_name
 order by lower(lov_exp.dimension_name)-- ,lower(loc.dimension_name)