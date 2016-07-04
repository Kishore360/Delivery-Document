drop table if exists app_test.ds_cost_center;
create table app_test.ds_cost_center
select Driver.sys_id AS row_id,
Driver.sourceinstance AS source_id ,
cmn_cost_center.parent AS parent_row_id,
cmn_cost_center.name AS cost_center_name,
cmn_cost_center.manager AS cost_center_manager,
cmn_cost_center.sys_id AS cost_center_id,
cmn_cost_center.account_number AS cost_center_account,
'Y' as active_flag,
CASE WHEN cmn_cost_center.code IS NULL THEN cmn_cost_center.name ELSE cmn_cost_center.code end as cost_center_code ,
cmn_cost_center.location AS location_id,
sys_created_on AS created_on,
sys_updated_on AS changed_on
from 
(
	SELECT sys_id, sourceinstance 
	FROM <<tenant>>_mdsdb.cmn_cost_center_final 
    UNION
    SELECT A.sys_id, A.sourceinstance 
	FROM <<tenant>>_mdsdb.cmn_cost_center_final A
    JOIN <<tenant>>_mdsdb.cmn_cost_center_final B ON A.sys_id = B.sys_id AND A.sourceinstance = B.sourceinstance
)Driver
LEFT OUTER JOIN <<tenant>>_mdsdb.cmn_cost_center_final cmn_cost_center 
ON cmn_cost_center.sys_id = Driver.sys_ID 
AND cmn_cost_center.sourceinstance = Driver.sourceinstance;
