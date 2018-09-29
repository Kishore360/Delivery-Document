SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_kronos_time_punch_c.nyp_cost_center_c_key' ELSE 'SUCCESS' END as Message
 FROM 
 (select count(1) as CNT from 
 (select keyfield, sourceinstance,center_name, cost_center from 
  nypres_mdsdb.us_kronos_time_punch_data_final) SRC
  left join  
  nypres_mdwdb.f_kronos_time_punch_c TRGT
  on SRC.keyfield=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 join  nypres_mdwdb.d_nyp_cost_center_c LKP
 on SRC.cost_center=LKP.cost_center_number_c and SRC.sourceinstance=LKP.source_id
  where LKP.row_key <> TRGT.nyp_cost_center_c_key) temp;
