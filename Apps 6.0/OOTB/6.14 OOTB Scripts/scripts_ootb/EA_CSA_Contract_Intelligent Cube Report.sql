select D.contract_number cnt_num,

D.active_flag active,

TO_CHAR((D.contract_start_on),'fmMM/fmDD/YYYY') start_dt,

TO_CHAR((D.contract_end_on),'fmMM/fmDD/YYYY') end_dt,

STATE.dimension_name status,

exp_bucket.dimension_name age_bucket,

CUST.organization_name cust_name,

PM.model_name case_product,

count(F.service_contract_key) no_of_contracts,

sum(case when STATE.dimension_name = 'Expired' and F.service_contract_key is not null then 1 else null end) expired_contracts,

sum(case when D.auto_renew_flag = 'Y' and F.service_contract_key is not null then 1 else null end) renewed_contracts

from #DWH_TABLE_SCHEMA.f_service_contract F
join #DWH_TABLE_SCHEMA.d_service_contract D
on F.service_contract_key = D.row_key
join #DWH_TABLE_SCHEMA.d_product_model PM
on F.product_model_key = PM.row_key
join  
(
SELECT lov.*
FROM #DWH_TABLE_SCHEMA.d_lov lov
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~SERVICE_CONTRACT'
UNION ALL 
SELECT lov.*
FROM #DWH_TABLE_SCHEMA.d_lov lov
WHERE lov.row_key = -1 OR lov.row_key = 0
) STATE
on STATE.row_key = D.state_src_key
join
(
SELECT lov.*
FROM #DWH_TABLE_SCHEMA.d_lov lov
WHERE lov.dimension_class = 'EXPIRYAGEBUCKET_WH~SERVICE_CONTRACT' OR lov.row_key = -1 OR lov.row_key = 0
) exp_bucket
on exp_bucket.row_key = D.contract_expiry_age_key
join #DWH_TABLE_SCHEMA.d_organization_customer CUST
on CUST.row_key = F.customer_account_key
-- where 
group by cnt_num, active, start_dt, end_dt, status, age_bucket, cust_name, case_product
order by cnt_num, active, start_dt, end_dt, status, age_bucket, cust_name, case_product


