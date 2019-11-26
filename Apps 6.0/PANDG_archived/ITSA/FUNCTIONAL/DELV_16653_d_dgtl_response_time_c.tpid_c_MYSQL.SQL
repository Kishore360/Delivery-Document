SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_response_time_c.tpid_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.us_dgtl_response_time_data_final SRC 
LEFT JOIN png_mdwdb.d_dgtl_response_time_c TRGT 
ON CONCAT(COALESCE(SRC.Test_Name,'UNSPECIFIED'),COALESCE(SRC.Date,'UNSPECIFIED'))=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CASE WHEN 
SUBSTRING_INDEX(SUBSTRING_INDEX(SRC.Test_Name, '_',4), '_',-1) REGEXP '^[0-9]*$' 
then SUBSTRING_INDEX(SUBSTRING_INDEX(SRC.Test_Name, '_',4),'_', -1) 
when SUBSTRING_INDEX(SUBSTRING_INDEX(SRC.Test_Name, '_',5), '_',-1) REGEXP '^[0-9]*$' 
then SUBSTRING_INDEX(SUBSTRING_INDEX(SRC.Test_Name,'_',5),'_',-1)  
when SUBSTRING_INDEX(SUBSTRING_INDEX(SRC.Test_Name,'_',6),'_',-1) REGEXP '^[0-9]*$' 
then SUBSTRING_INDEX(SUBSTRING_INDEX(SRC.Test_Name,'_', 6),'_',-1) 
when SUBSTRING_INDEX(SUBSTRING_INDEX(SRC.Test_Name,'_',7),'_',-1) REGEXP '^[0-9]*$' 
then SUBSTRING_INDEX(SUBSTRING_INDEX(SRC.Test_Name,'_', 7),'_',-1)  
end <>TRGT.tpid_c
AND SRC.cdctype='X'
) temp;
 
 
  
  

