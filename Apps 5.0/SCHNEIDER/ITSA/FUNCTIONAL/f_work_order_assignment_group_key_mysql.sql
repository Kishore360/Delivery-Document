SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order.assignment_group_key' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.f_work_order TRGT ON (SRC.work_order_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN schneider_mdwdb.d_internal_organization LKP ON ( concat( 'GROUP~' ,upper( coalesce(SRC.Support_Group_Name2 , Support_Group_ID_2))) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN coalesce(SRC.Support_Group_Name2 , Support_Group_ID_2) IS NULL THEN 0 else -1 end)<> (TRGT.assignment_group_key) 
