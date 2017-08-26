SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.physical_location_c' ELSE 'SUCCESS' END as Message from 
(select count(1) cnt 
from whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_asset TRGT 
 ON ( CONCAT('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id) 
  WHERE SRC.u_physical_location<> TRGT.physical_location_c)t;
