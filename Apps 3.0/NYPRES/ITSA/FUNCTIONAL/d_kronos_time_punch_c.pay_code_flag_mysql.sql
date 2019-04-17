SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_kronos_time_punch_c.pay_code_flag' ELSE 'SUCCESS' END as Message
 FROM 
 (select count(1) as CNT from 
 (select row_id, sourceinstance,out_scheduled from 
  nypres_mdsdb.us_kronos_time_punch_data_final) SRC
   join  
  nypres_mdwdb.d_kronos_time_punch_c TRGT
  on SRC.row_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id  
  where  case when SRC.out_scheduled is null then 'Y' else 'N' end <> TRGT.pay_code_flag
  and TRGT.soft_deleted_flag='N') temp;
