SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.full_name' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.knta_users_final SRC
join fidelity_mdwdb.d_internal_contact TRGT 
on COALESCE(floor(SRC.user_id),'UNSPECIFIED')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where COALESCE(SRC.full_name,'UNSPECIFIED') <> TRGT.full_name and SRC.cdctype<>'D';