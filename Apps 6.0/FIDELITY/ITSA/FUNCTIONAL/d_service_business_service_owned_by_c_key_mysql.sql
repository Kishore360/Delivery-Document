SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service.business_service_owned_by_c_key' ELSE 'SUCCESS' END as Message
 from
fidelity_mdsdb.cmdb_ci_service_final SRC
LEFT JOIN fidelity_mdwdb.d_internal_contact TRGT 
ON (SRC.sourceinstance =TRGT.source_id 
and coalesce(concat('INTERNAL_CONTACT~',SRC.owned_by),'UNSPECIFIED' )= TRGT.row_id )
JOIN fidelity_mdwdb.d_service trgt1
on CONCAT('BUSINESS_SERVICE','~',SRC.sys_id) = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
WHERE coalesce(TRGT.row_key,case when SRC.owned_by is null then 0 else -1 end) <> trgt1.business_service_owned_by_c_key;