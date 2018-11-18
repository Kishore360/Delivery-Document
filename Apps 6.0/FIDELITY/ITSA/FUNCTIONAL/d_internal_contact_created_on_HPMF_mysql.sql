
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.created_on' ELSE 'SUCCESS' END as Message
FROM  (select * from fidelity_mdsdb.hp_knta_users_final where  cdctype<>'D') SRC
left join (select * from fidelity_mdwdb.d_internal_contact) TRGT
on CONCAT('INTERNAL_CONTACT~', SRC.USER_ID) =TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where COALESCE(CONVERT_TZ(SRC.creation_date,'GMT','America/New_York'),'') <> COALESCE(TRGT.created_on,'');