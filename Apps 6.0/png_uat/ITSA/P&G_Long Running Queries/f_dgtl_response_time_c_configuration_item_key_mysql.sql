SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_dgtl_response_time_c.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  Count(1) as CNT
from  png_mdsdb.us_dgtl_response_time_data_final SRC
JOIN png_mdwdb.f_dgtl_response_time_c TRGT
ON concat (COALESCE(SRC.Test_Name,'UNSPECIFIED'),COALESCE(SRC.Date,'UNSPECIFIED')) = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
join png_mdwdb.d_dgtl_response_time_c b on TRGT.dgtl_response_time_c_key=b.row_id and TRGT.source_id=b.source_id
join (select max(sys_id) sys_id,COALESCE(pid,'UNSPECIFIED') pid from png_mds_viewdb.cmdb_ci_web_site_final group by COALESCE(pid,'UNSPECIFIED')) 
as c on 
b.tpid_c=c.pid AND b.source_id=c.sourceinstance
where TRGT.configuration_item_key <> coalesce(c.sys_id,'UNSPECIFIED')
)temp;


