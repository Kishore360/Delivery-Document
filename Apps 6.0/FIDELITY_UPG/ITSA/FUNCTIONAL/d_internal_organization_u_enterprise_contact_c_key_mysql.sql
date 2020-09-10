
 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.u_enterprise_contact_c_key' ELSE 'SUCCESS' END as Message   from  fidelity_mdwdb.d_internal_organization TRGT 
  join fidelity_mdsdb.sys_user_group_final src on concat('GROUP~',src.sys_id)=TRGT.row_id
  left join fidelity_mdwdb.d_internal_contact dt on dt.row_id=COALESCE(CONCAT('INTERNAL_CONTACT~',
                src.u_enterprise_contact),
                'UNSPECIFIED')
 where TRGT.u_enterprise_contact_c_key<>dt.row_key

 