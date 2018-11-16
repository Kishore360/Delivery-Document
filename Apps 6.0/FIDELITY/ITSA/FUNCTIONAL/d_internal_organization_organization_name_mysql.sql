SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_organization.organization_name' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.knta_lookups_final SRC
join fidelity_mdwdb.d_internal_organization TRGT 
on COALESCE(CONCAT(SRC.lookup_code,'~~~','DEPT'),'UNSPECIFIED')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where COALESCE(SRC.meaning,'UNSPECIFIED')  <> TRGT.organization_name ;