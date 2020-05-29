select  ds.supplier_name , da.acquisition_method as Acquisition_method , count(case when da.acquisition_method = 'Lease'then fa.asset_key end )  from 
#DWH_TABLE_SCHEMA.f_asset fa
left join #DWH_TABLE_SCHEMA.d_asset da
on fa.asset_key = da.row_key
left join #DWH_TABLE_SCHEMA.d_supplier ds
on ds.row_key = fa.supplier_key
group by ds.supplier_name , da.acquisition_method
order by lower(ds.supplier_name), lower(da.acquisition_method)



