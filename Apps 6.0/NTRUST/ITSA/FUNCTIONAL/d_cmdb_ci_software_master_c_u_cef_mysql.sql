SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END
as Message from(
select count(1) as cnt from
ntrs_mdsdb.incident_final SRC
 join ntrs_mdsdb.cmdb_ci_model_final SRC1 on SRC.u_product_name=SRC1.sys_id
 join ntrs_mdsdb.u_cmdb_ci_software_master_final SRC2 on (SRC1.u_software=SRC2.sys_id AND 
SRC1.sourceinstance=SRC2.sourceinstance)
 
 join ntrs_mdwdb.d_cmdb_ci_model_c LKP on SRC1.sys_id=LKP.row_id
 join ntrs_mdwdb.d_cmdb_ci_software_master_c LKP2 on SRC2.sys_id=LKP2.row_id
where (case when SRC2.u_cef='Yes' then 'Y' when SRC2.u_cef='No' then 'N' else SRC2.u_cef end )<>LKP2.u_cef)a;
