SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM
tivo_mdwdb.d_internal_organization stg
LEFT JOIN tivo_mdsdb.core_company_final src ON stg.row_id = CONCAT('SUBSIDIARY~',src.sys_id) AND stg.source_id = src.sourceinstance
LEFT JOIN tivo_mdwdb.d_lov lkp ON lkp.row_id = CONCAT('COMPANY_TYPE~CORE_COMPANY~~~',src.u_company_type)
where  stg.company_type_src_c_key <>coalesce(lkp.row_key,case when u_company_type is null then 0 else -1 end )


