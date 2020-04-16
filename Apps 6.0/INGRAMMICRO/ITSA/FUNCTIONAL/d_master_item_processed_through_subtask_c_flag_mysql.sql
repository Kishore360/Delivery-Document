SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_master_item.processed_through_subtask_c_flag' ELSE 'SUCCESS' END as Message
FROM ingrammicro_mdsdb.sc_cat_item_final SRC
JOIN ingrammicro_mdsdb.sc_cat_item_producer_final LKP ON SRC.sys_id=LKP.sys_id and SRC.sourceinstance=LKP.sourceinstance
JOIN ingrammicro_mdwdb.d_master_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id
WHERE SRC.CDCTYPE<>'D' AND CASE WHEN LKP.u_processed_through_subtask=1 THEN 'Y' ELSE 'N' END
<>TRGT.processed_through_subtask_c_flag ;

