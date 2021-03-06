SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_application.irmo_validated_flag_c' ELSE 'SUCCESS' END as Message 
FROM (
select count(1) as CNT from  nbcu_mdsdb.cmdb_ci_appl_final SRC
LEFT JOIN nbcu_mdwdb.d_application TRGT
ON (concat('APPLICATION','~',SRC.sys_id)= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)  and TRGT.soft_deleted_flag <>'Y'
where coalesce( (case  when SRC.u_irmo_validated =1 THEN 'Y' ELSE 'N' END ),'UNSPECIFIED')<>TRGT.irmo_validated_flag_c
)temp;


         