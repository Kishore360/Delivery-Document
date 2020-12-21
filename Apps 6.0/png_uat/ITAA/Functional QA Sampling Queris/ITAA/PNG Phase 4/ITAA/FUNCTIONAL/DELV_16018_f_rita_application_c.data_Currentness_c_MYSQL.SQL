SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.data_Currentness_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdwdb.f_rita_application_c a 
JOIN png_mdwdb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN (SELECT source_id , max(lastupdated) as last_updated from png_workdb.o_data_freshness group by 1) c ON a.source_id = c.source_id 
WHERE 
(
CASE WHEN 
(datediff(last_updated,mega_creation_date) <= 365 or datediff(last_updated,PG_DATE_LAST_REVIEWED) <= 365 )
OR(mega_creation_date is NULL and datediff(last_updated,PG_DATE_LAST_REVIEWED) <= 365 )
OR(datediff(last_updated,mega_creation_date) <= 365 and PG_DATE_LAST_REVIEWED is NULL ) THEN 1 
ELSE 0 END or data_Currentness_c is NULL
)<>a.data_Currentness_c
AND a.soft_deleted_flag='N'
)temp;

  
  
  
  
  