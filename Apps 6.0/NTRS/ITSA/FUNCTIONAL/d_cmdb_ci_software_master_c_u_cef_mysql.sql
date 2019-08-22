SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END
as Message from(
select count(1) as cnt from
ntrs_mdsdb.incident_final SRC
left join ntrs_mdsdb.cmdb_ci_model_final SRC1 on SRC.u_product_name=SRC1.sys_id
left join ntrs_mdsdb.u_cmdb_ci_software_master_final SRC2 on (SRC1.u_software=SRC2.sys_id AND 
SRC1.sourceinstance=SRC2.sourceinstance)
left join ntrs_mdwdb.f_incident TRGT on (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left join ntrs_mdwdb.d_cmdb_ci_model_c LKP on LKP.row_key=TRGT.cmdb_ci_model_c_key
left join ntrs_mdwdb.d_cmdb_ci_software_master_c LKP2 on LKP2.row_key=LKP.cmdb_ci_software_master_c_key
where (case when SRC2.u_cef='Yes' then 'Y' when SRC2.u_cef='No' then 'N' else u_cef end )<>LKP2.u_cef)a;
