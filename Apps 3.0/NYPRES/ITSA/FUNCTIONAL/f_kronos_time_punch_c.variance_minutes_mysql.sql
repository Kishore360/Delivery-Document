SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_kronos_time_punch_c.variance_minutes' ELSE 'SUCCESS' END as Message
 FROM 
 (select count(1) as CNT from 
 (select keyfield, sourceinstance,late_in,early_out,in_punched,in_scheduled,out_scheduled,out_punched from 
  nypres_mdsdb.us_kronos_time_punch_data_final) SRC
  left join  
  nypres_mdwdb.f_kronos_time_punch_c TRGT
  on SRC.keyfield=TRGT.row_id and SRC.sourceinstance=TRGT.source_id  
  where  
  (case when SRC.late_in="Y" then timestampdiff(second,SRC.in_scheduled,SRC.in_punched) else 0 end + 
  case when SRC.early_out="Y" then timestampdiff(second,SRC.out_punched,SRC.out_scheduled) else 0 end)/60  <> TRGT.variance_minutes) temp;
