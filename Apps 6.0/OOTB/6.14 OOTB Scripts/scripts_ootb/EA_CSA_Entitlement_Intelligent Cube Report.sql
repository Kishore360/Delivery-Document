select D.entitlement_name ent_name,
TO_CHAR((D.entitlement_start_on),'fmMM/fmDD/YYYY') start_dt,
TO_CHAR((D.entitlement_end_on),'fmMM/fmDD/YYYY') end_dt,
D.active_flag active,
D.is_expired expiry_flag,
exp_bucket.dimension_name age_bucket,
unit.dimension_name unit,
D.per_unit_flag per_unit_flag,
D_CNTR.contract_number cnt_num,
CUST.organization_name cust_name,
PM.model_name case_product,
asset.display_name asset_name,

sum(D.remaining_units) ent_remaining_units,
case when sum(D.total_units) = 0 then null 
else concat(round(((sum(D.total_units) - sum(D.remaining_units)) * 100.00 /sum(D.total_units)),0), '%') end ent_remaining_units_prct,
sum(D.total_units) ent_total_units

from #DWH_TABLE_SCHEMA.f_service_entitlement F
join #DWH_TABLE_SCHEMA.d_service_entitlement D
on F.service_entitlement_key = D.row_key
join #DWH_TABLE_SCHEMA.d_service_contract D_CNTR
on F.service_contract_key = D_CNTR.row_key
join #DWH_TABLE_SCHEMA.d_product_model PM
on F.product_model_key = PM.row_key
join
(
SELECT lov.*
FROM #DWH_TABLE_SCHEMA.d_lov lov
WHERE lov.dimension_class = 'EXPIRYAGEBUCKET_WH~SERVICE_ENTITLEMENT' OR lov.row_key = -1 OR lov.row_key = 0
) exp_bucket
on exp_bucket.row_key = D.entitlement_expiry_age_key
join
(
select lov.*
FROM #DWH_TABLE_SCHEMA.d_lov lov
WHERE lov.dimension_class = 'UNIT~SERVICE_ENTITLEMENT' OR lov.row_key = -1 OR lov.row_key = 0
) unit
on unit.row_key = D.unit_src_key
join #DWH_TABLE_SCHEMA.d_organization_customer CUST
on CUST.row_key = F.customer_account_key
join #DWH_TABLE_SCHEMA.d_asset asset
on asset.row_key = F.asset_key
-- where 
group by ent_name, start_dt, end_dt, active, expiry_flag, age_bucket, unit, per_unit_flag, cnt_num, cust_name, case_product, asset_name
order by lower(D.entitlement_name), start_dt, end_dt, active, expiry_flag, age_bucket, unit, per_unit_flag, cnt_num, cust_name, case_product, asset_name