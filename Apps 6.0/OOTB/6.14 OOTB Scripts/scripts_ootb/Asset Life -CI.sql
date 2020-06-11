select dci.row_key ,''as metric , 
case when round(sum(((fa.asset_age_days + fa.asset_balance_life) / 30.0)),1) < 1
then '('||trim(to_char(round(sum(((fa.asset_age_days + fa.asset_balance_life) / 30.0)),1)*(-1.0), '9,999,999,990D9'))||')'
else trim(to_char(round(sum(((fa.asset_age_days + fa.asset_balance_life) / 30.0)),1), '9,999,999,990D9')) end,

case when round(sum(((fa.asset_age_days + fa.asset_balance_life) / 365.0)),1) <= 0
then '('||trim(to_char(round(sum(((fa.asset_age_days + fa.asset_balance_life) / 365.0)),1)*(-1.0), '9,999,999,990D9'))||')'
else trim(to_char(round(sum(((fa.asset_age_days + fa.asset_balance_life) / 365.0)),1), '9,999,999,990D9')) end,
 from 
(
 SELECT f.asset_assigned_on_key, f.asset_assigned_to_key, f.asset_class_key, f.asset_created_on, f.asset_created_on_key, f.asset_key, f.asset_purchase_on_key, f.asset_retirement_on_key, f.asset_status_key, f.asset_substatus_key, f.assigned_date, f.cdctype, f.changed_by, f.changed_on, f.configuration_item_key, f.contract_key, f.cost_center_key, f.cost_doc_amount, f.cost_loc_amount, f.created_by, f.created_on, f.department_key, f.depreciated_doc_amount, f.depreciated_loc_amount, f.doc_currency_key, f.domain_key, f.dw_inserted_on, f.dw_updated_on, f.etl_run_number, f.installed_on, f.is_new, f.is_retiring, f.is_warranty_active, f.loc_currency_key, f.location_key, f.model_category_key, f.month_bucket, f.product_model_key, f.project_key, f.quantity, f.quarter_bucket, f.residual_doc_amount, f.residual_loc_amount, f.retirement_date, f.row_id, f.row_key, f.salvage_value, f.secondary1_changed_on, f.secondary2_changed_on, f.soft_deleted_flag, f.source_id, f.storage_location_key, f.supplier_key, f.warranty_days_bucket AS days_to_warranty_expire, COALESCE(wtyb.row_key, 0::bigint) AS warranty_days_bucket, f.warranty_expiration_date, f.warranty_expiry_on_key, f.week_bucket, f.year_bucket, mb.row_key AS month_bucket_key, qb.row_key AS quarter_bucket_key, yb.row_key AS year_bucket_key, wb.row_key AS week_bucket_key, f.doc_currency_code, f.loc_currency_code, f.asset_balance_life, f.day_bucket AS asset_age_days, f.asset_owned_by_key, f.resale_price_doc_amount, f.resale_price_loc_amount
   FROM #DWH_TABLE_SCHEMA.f_asset f
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov mb ON f.source_id = mb.source_id AND mb.dimension_class::text = 'ASSET_AGE'::text AND mb.dimension_type::text = 'MONTH_BUCKET'::text AND f.month_bucket >= mb.lower_range_value AND f.month_bucket < mb.upper_range_value
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov qb ON f.source_id = qb.source_id AND qb.dimension_class::text = 'ASSET_AGE'::text AND qb.dimension_type::text = 'QUARTER_BUCKET'::text AND f.quarter_bucket >= qb.lower_range_value AND f.quarter_bucket < qb.upper_range_value
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov yb ON f.source_id = yb.source_id AND yb.dimension_class::text = 'ASSET_AGE'::text AND yb.dimension_type::text = 'YEAR_BUCKET'::text AND f.year_bucket >= yb.lower_range_value AND f.year_bucket < yb.upper_range_value
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wb ON f.source_id = wb.source_id AND wb.dimension_class::text = 'ASSET_AGE'::text AND wb.dimension_type::text = 'WEEK_BUCKET'::text AND f.week_bucket >= wb.lower_range_value AND f.week_bucket < wb.upper_range_value
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wtyb ON f.source_id = wtyb.source_id AND wtyb.dimension_class::text = 'WARRANTY'::text AND wtyb.dimension_type::text = 'DAY_BUCKET'::text AND f.warranty_days_bucket >= wtyb.lower_range_value AND f.warranty_days_bucket < wtyb.upper_range_value
  WHERE f.soft_deleted_flag = 'N'::bpchar

) fa 
join #DWH_TABLE_SCHEMA.d_configuration_item dci 
on dci.row_key = fa.configuration_item_key
group by (dci.row_key)
order by (dci.row_key)



