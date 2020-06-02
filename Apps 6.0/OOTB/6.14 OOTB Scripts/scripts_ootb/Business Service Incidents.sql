select dsv.name as "business service name", case when dsv.criticality is Null then 'UNSPECIFIED' else dsv.criticality end , dv.dimension_name , dsv.version ,'' as metric ,
trim(to_char(count(fi.row_key),'999,999,990')) from #DWH_TABLE_SCHEMA.f_incident fi 
join #DWH_TABLE_SCHEMA.d_service dsv
on dsv.row_key =  fi.business_service_key 
join #DWH_TABLE_SCHEMA.d_lov dv 
on dv.row_key = dsv.used_for_src_key
left join #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on dcd.row_key = fi.opened_on_key
where dcd.lagging_count_of_month between 0 and 12
and fi.soft_deleted_flag = 'N'
group by dsv.name , dsv.criticality, dv.dimension_name, dsv.version
order by lower(dsv.name), lower(dsv.criticality), lower(dv.dimension_name), lower(dsv.version)