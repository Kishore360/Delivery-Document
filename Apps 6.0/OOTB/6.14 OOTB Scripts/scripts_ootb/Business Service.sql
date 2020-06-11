select dsv.name as "business service name", coalesce(dsv.criticality, 'UNSPECIFIED') as "Critcality" , dv.dimension_name , dsv.version ,'' as metric ,count(fp.row_key)  from #DWH_TABLE_SCHEMA.d_service dsv
join #DWH_TABLE_SCHEMA.f_problem fp
on dsv.row_key =  fp.business_service_key 
join #DWH_TABLE_SCHEMA.d_lov dv 
on dv.row_key = dsv.used_for_src_key
left join #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class
where fp.soft_deleted_flag = 'N'
group by dsv.name , dsv.criticality, dv.dimension_name, dsv.version
order by lower(dsv.name), lower(dsv.criticality), lower(dv.dimension_name), lower(dsv.version)
