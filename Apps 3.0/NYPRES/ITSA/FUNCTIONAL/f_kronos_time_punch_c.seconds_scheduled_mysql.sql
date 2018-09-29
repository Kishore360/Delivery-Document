SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_kronos_time_punch_c.seconds_scheduled' ELSE 'SUCCESS' END as Message
 FROM 
 (select count(1) as CNT from 
 (select keyfield, sourceinstance,late_in,early_out,in_punched,in_scheduled,out_scheduled,out_punched from 
  nypres_mdsdb.us_kronos_time_punch_data_final) SRC
  left join  
  nypres_mdwdb.f_kronos_time_punch_c TRGT
  on SRC.keyfield=TRGT.row_id and SRC.sourceinstance=TRGT.source_id  
  where  
  case when SRC.out_scheduled is null THEN 0 ELSE timestampdiff(second,SRC.in_scheduled,SRC.out_scheduled) end <> TRGT.seconds_scheduled) temp;