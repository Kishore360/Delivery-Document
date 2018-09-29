SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_kronos_time_punch_c.cwid_key' ELSE 'SUCCESS' END as Message
 FROM 
 (select count(1) as CNT from 
 (select keyfield, sourceinstance,cwid from 
  nypres_mdsdb.us_kronos_time_punch_data_final) SRC
  left join  
  nypres_mdwdb.f_kronos_time_punch_c TRGT
  on SRC.keyfield=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
  join nypres_mdwdb.d_internal_contact LKP on SRC.cwid=LKP.user_name and SRC.sourceinstance=LKP.source_id
  where LKP.row_key <> TRGT.cwid_key) temp;
