SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_kronos_time_punch_c.out_punch_exception' ELSE 'SUCCESS' END as Message
 FROM 
 (select count(1) as CNT from 
 (select keyfield, sourceinstance,out_punch_exception from 
  nypres_mdsdb.us_kronos_time_punch_data_final) SRC
  left join  
  nypres_mdwdb.d_kronos_time_punch_c TRGT
  on SRC.keyfield=TRGT.row_id and SRC.sourceinstance=TRGT.source_id  
  where coalesce( SRC.out_punch_exception, 'UNSPECIFIED') <> TRGT.out_punch_exception) temp;
