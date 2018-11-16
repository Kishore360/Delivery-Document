 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.department_key' ELSE 'SUCCESS' END as Message;
 FROM (select * from fidelity_mdsdb.hp_knta_users_final where  cdctype<>'D') SRC 
left join (select * from fidelity_mdwdb.d_internal_organization)  LKP
on concat('DEPARTMENT~',SRC.DEPARTMENT_CODE) = LKP.row_id AND  SRC.sourceinstance=LKP.source_id
left join (select * from fidelity_mdwdb.d_internal_contact) TRGT
on CONCAT('INTERNAL_CONTACT~', SRC.USER_ID) =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id

where COALESCE(LKP.row_key , case when SRC.DEPARTMENT_CODE is null then 0 else -1 end , '') <> COALESCE(TRGT.department_key,'')