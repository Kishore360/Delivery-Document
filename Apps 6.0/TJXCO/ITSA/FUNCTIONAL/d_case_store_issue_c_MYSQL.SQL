SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_case.store_issue_c' ELSE 'SUCCESS' END as Message
FROM 
(select count(1) as cnt   FROM 
tjxco_mdsdb.sn_customerservice_case_final SRC
left join tjxco_mdwdb.d_case TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where case when SRC.u_store_issue is null or SRC.u_store_issue='No' then 'N' else 'Y' end<>TRGT.store_issue_c
and SRC.cdctype<>'D' and TRGT.soft_deleted_flag='N'
)ma;

