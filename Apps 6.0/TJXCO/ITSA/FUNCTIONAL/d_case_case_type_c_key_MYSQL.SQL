SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_case.case_type_c_key' ELSE 'SUCCESS' END as Message
FROM 
(select count(1) as cnt   FROM 
tjxco_mdsdb.sn_customerservice_case_final SRC
left join tjxco_mdwdb.d_case TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join tjxco_mdwdb.d_customer_service_taxonomy_c LKP
on coalesce(SRC.u_type)=LKP.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(LKP.row_key,case when SRC.u_type is null then 0 else -1 end)<>TRGT.case_type_c_key
and SRC.cdctype<>'D' and TRGT.soft_deleted_flag='N'
)ma;

