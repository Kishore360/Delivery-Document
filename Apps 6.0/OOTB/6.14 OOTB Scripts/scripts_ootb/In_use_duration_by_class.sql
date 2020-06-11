

select
lom_class.dimension_wh_code
,

case when round(( sum(case when stat_his.current_flag='Y'and  lom.dimension_wh_code = 'In Use' then f.cost_doc_amount else 0 end ) ),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round(((sum(case when stat_his.current_flag='Y' and lom.dimension_wh_code = 'In Use' then f.cost_doc_amount else 0 end ))/1000),0),0), '9,999,999,990')),'K')) 
else concat('$',(trim(to_char(coalesce(round((sum(case when stat_his.current_flag='Y' and  lom.dimension_wh_code = 'In Use' then f.cost_doc_amount else 0 end ))),0), '9,999,999,990')))) end
as inuse_asset_cost 
,

case when round(( sum(case when stat_his.current_flag='Y'and  lom.dimension_wh_code in ('In Use', 'In Maintenance', 'In Stock', 'In Transit') then f.cost_doc_amount else 0 end ) ),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round(((sum(case when stat_his.current_flag='Y' and lom.dimension_wh_code in ('In Use', 'In Maintenance', 'In Stock', 'In Transit') then f.cost_doc_amount else 0 end ))/1000),0),0), '9,999,999,990')),'K')) 
else concat('$',(trim(to_char(coalesce(round((sum(case when stat_his.current_flag='Y' and  lom.dimension_wh_code in ('In Use', 'In Maintenance', 'In Stock', 'In Transit') then f.cost_doc_amount else 0 end ))),0), '9,999,999,990')))) end
as active_asset_cost 
,sum(case when stat_his.current_flag='Y'and  lom.dimension_wh_code = 'In Use'  then 1 else 0 end ) as inuse_asset_count
-- ,to_char(count(case when stat_his.current_flag='Y' then f.row_key else null end ),'FM999,999') as no_assets
,sum(case when stat_his.current_flag='Y'and  lom.dimension_wh_code in ('In Use', 'In Maintenance', 'In Stock', 'In Transit') then 1 else 0 end ) as active_asset_count
,
to_char(sum(case when lom.dimension_wh_code = 'In Use'  then datediff(day,status_start_on,status_end_on)
else 0 end),'FM999,990.0')  as inuse_asset_duration_days
,to_char(round((sum(case when lom.dimension_wh_code = 'In Use'  then datediff(day,status_start_on,status_end_on)
else 0 end))/count(case when stat_his.current_flag='Y' then f.row_key else null end )::decimal(22,10) ,1),'FM999,990.0')  as avg_inuse_asset_duration_days
,to_char(round(((sum(case when lom.dimension_wh_code = 'In Use'  then datediff(day,status_start_on,status_end_on)
else 0 end))/count(case when stat_his.current_flag='Y' then f.row_key else null end )::decimal(22,10))/30.0,1) ,'FM999,990.0')  as avg_inuse_asset_duration_months

,
round (((sum(case when lom.dimension_wh_code = 'In Use'  then datediff(day,status_start_on,status_end_on)
else 0 end))/ (sum( case when stat_his.current_flag='Y' then f.asset_age else null end )))*100 ,1)||'%' as avg_in_use_time_ratio

-- ,sum(f.total_spend_doc_amount*0.022) as prod_cost
from #DWH_TABLE_SCHEMA.d_asset d
inner join #DWH_TABLE_SCHEMA.f_asset f
on d.row_key=f.asset_key
and f.soft_deleted_flag<>'Y'
 
  join (  
   select asset_key, asset_status_key,asset_substatus_key-- ,duration
 -- ,sum(datediff(day,status_start_on,status_end_on)) as s
  , status_start_on,status_end_on,current_flag
   FROM #DWH_TABLE_SCHEMA.f_asset_status_history
  WHERE f_asset_status_history.soft_deleted_flag = 'N'::bpchar)stat_his
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
 -- and( lom.dimension_wh_code in ('In Use', 'In Maintenance', 'In Stock', 'In Transit'))
   join #DWH_TABLE_SCHEMA.d_asset_class da_class
 on da_class.row_key=d.asset_class_key
 
 join 
 (select lo.* from #DWH_TABLE_SCHEMA.d_lov lo
 where
 (lo.dimension_class::text = 'ASSET'::text AND lo.dimension_type::text = 'CLASS_NAME'::text)
 or lo.row_key in (0,-1)
 )lov_class
 on da_class.asset_class_name::text = lov_class.dimension_name::text
 
  join #DWH_TABLE_SCHEMA.d_lov_map lom_class
 on lov_class.row_key=lom_class.src_key
 group by lom_class.dimension_wh_code
 order by lom_class.dimension_wh_code