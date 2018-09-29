SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_kronos_time_punch_c.mpf_total' ELSE 'SUCCESS' END as Message
 FROM 
 (select count(1) as CNT from 
 (select keyfield, sourceinstance,out_punched,out_punch_source, out_scheduled,in_punch_source from 
  nypres_mdsdb.us_kronos_time_punch_data_final) SRC
  left join  
  nypres_mdwdb.f_kronos_time_punch_c TRGT
  on SRC.keyfield=TRGT.row_id and SRC.sourceinstance=TRGT.source_id  
  where  
  (case when SRC.out_scheduled is null or SRC.in_punch_source = 'Clock' or SRC.in_punch_source = 'Remote' then 0 else 1 end) +
  (case when SRC.out_punched is null or SRC.out_punch_source = 'Clock' or SRC.out_punch_source = 'Remote' then 0 else 1 end) <> TRGT.mpf_total) temp;
