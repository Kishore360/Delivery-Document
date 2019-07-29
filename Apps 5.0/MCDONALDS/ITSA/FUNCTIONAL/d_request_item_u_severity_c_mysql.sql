SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_defect_rm_c.impact_src_key' ELSE 'SUCCESS' END as Message
FROM ( select count(1) cnt from (
 select number,SRC.description,TRGT.severity_c severity_c_trgt,
 case when  left(replace (substring(SRC.description,instr(SRC.description,'Severity')+length('Severity')),':',''),5) = (' High') then 'High'
  when  left(replace (substring(SRC.description,instr(SRC.description,'Severity')+length('Severity')),':',''),5) = (' Medium') then 'Medium'
  when  left(replace (substring(SRC.description,instr(SRC.description,'Severity')+length('Severity')),':',''),5) = (' Low') then 'Low' else 'UNSPECIFIED' end
  severity_c 
 from mcdonalds_mdsdb.sc_req_item_final SRC
 LEFT JOIN mcdonalds_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )where severity_c='High')a where severity_c_trgt<>severity_c)temp;