SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_entitlement.entitlement_expiry_age' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdwdb.d_service_entitlement d 
left join <<tenant>>_mdwdb.o_data_freshness o
on o.source_id=d.source_id
where (TIMESTAMPDIFF(DAY,DATE(o.lastupdated),coalesce(d.entitlement_end_on)) + 1) <>
d.entitlement_expiry_age
