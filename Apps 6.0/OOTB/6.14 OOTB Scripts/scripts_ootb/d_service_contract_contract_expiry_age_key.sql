-- for the -ve contract_expiry_age it should be converted to -1 for bucket  ECSA-63 ECSA-55
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_contract.contract_expiry_age_key' ELSE 'SUCCESS' END as Message
FROM 
(select row_key, contract_expiry_age_key, case when contract_expiry_age>=0 then (contract_expiry_age/86400) else -1 end as contract_expiry_age from #DWH_TABLE_SCHEMA.d_service_contract) d 
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.dimension_class='WH_EXPIRYAGEBUCKET~SERVICE_CONTRACT' and 
d.contract_expiry_age between LOV.lower_range_value and LOV.upper_range_value
where d.row_key not in (0,-1) and
(case when d.contract_expiry_age is null then null
     when (d.contract_expiry_age is not null and LOV.row_key is null) then -1
     else LOV.row_key end )
 <> coalesce(d.contract_expiry_age_key,'')

