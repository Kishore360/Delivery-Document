SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_summary.COUNT_OF_RECORDS' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.transactions_final SRC LEFT JOIN  #DWH_TABLE_SCHEMA.f_application_summary TRGT 
ON SRC.__numerify__primary_key = TRGT.row_id 
left join  #DWH_TABLE_SCHEMA.d_lov lov
ON concat('User~Experience~',SRC.userExperience) = lov.row_id 
WHERE coalesce(lov.row_key, case when  concat('User~Experience~',SRC.userExperience) is null then 0 else -1 END ) <> coalesce(TRGT.USER_EXPERIENCE_KEY,'') 





