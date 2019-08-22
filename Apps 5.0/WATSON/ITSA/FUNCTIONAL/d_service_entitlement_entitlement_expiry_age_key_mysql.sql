SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_entitlement.entitlement_expiry_age_key' ELSE 'SUCCESS' END as Message
FROM watson_mdwdb.d_service_entitlement d 
left join watson_mdwdb.d_lov LOV
on LOV.dimension_class='EXPIRYAGEBUCKET_WH~SERVICE_ENTITLEMENT' and 
d.entitlement_expiry_age between LOV.lower_range_value and LOV.upper_range_value
where d.row_key not in (0, -1) and 
LOV.row_key <> d.entitlement_expiry_age_key