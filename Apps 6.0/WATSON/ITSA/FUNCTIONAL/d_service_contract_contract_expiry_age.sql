SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_contract.contract_expiry_age' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdwdb.d_service_contract d 
left join ibmwatson_mdwdb.o_data_freshness o
on o.source_id=d.source_id
where d.row_key not in (0,-1) and
(TIMESTAMPDIFF(DAY,DATE(o.lastupdated),coalesce(d.renewal_end_on,d.contract_end_on)) + 1) <>
d.contract_expiry_age