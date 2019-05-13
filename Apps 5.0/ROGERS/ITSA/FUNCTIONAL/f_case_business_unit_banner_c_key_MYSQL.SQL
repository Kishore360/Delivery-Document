SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_case.business_unit_banner_c_key' ELSE 'SUCCESS' END as Message
FROM 
(select count(1) as cnt  FROM 
tjxco_mdsdb.sn_customerservice_case_final  SRC
left join tjxco_mdwdb.d_business_unit_banner_c LKP on COALESCE(SRC.u_banner,'UNSPECIFIED')=LKP.row_id
and SRC.sourceinstance=LKP.source_id 
left join tjxco_mdwdb.f_case TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where COALESCE(LKP.row_key,case when SRC.u_banner is null then 0 else -1 end)=TRGT.business_unit_banner_c_key
and SRC.cdctype<>'D' and TRGT.soft_deleted_flag='N'
)ma;