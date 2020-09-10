SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.end_date_c' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.knta_users_final SRC
join fidelity_mdwdb.d_internal_contact TRGT 
on COALESCE(floor(SRC.user_id),'UNSPECIFIED')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where COALESCE( SRC.end_date,  'UNSPECIFIED') <>TRGT.end_date_c;