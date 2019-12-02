SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.contact_active_flag' ELSE 'SUCCESS' END as Message
FROM 
(
select  count(1) cnt 
from png_mdsdb.sys_user_final src
join  png_mdwdb.d_internal_contact d on concat('INTERNAL_CONTACT~',src.sys_id)=d.row_id and sourceinstance=source_id
WHERE (CASE WHEN src.active='1' THEN 'Y' ELSE 'N' END)<>d.contact_active_flag
AND src.cdctype <>'D'
)a
  
  
  
  
 