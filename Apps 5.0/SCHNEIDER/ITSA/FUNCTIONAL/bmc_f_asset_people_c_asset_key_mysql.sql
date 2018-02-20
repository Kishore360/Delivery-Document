SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_key' ELSE 'SUCCESS' END as Message
  FROM  schneider_mdsdb.ast_assetpeople_final SRC 
  left join (select reconciliation_identity reconciliation_identity, sourceinstance sourceinstance, max(request_id) as request_id 
from schneider_mdsdb.ast_baseelement_final bse
where data_set_id = 'BMC.ASSET'
group by reconciliation_identity , sourceinstance)ast on SRC.assetinstanceid = ast.reconciliation_identity and SRC.sourceinstance = ast.sourceinstance
  JOIN schneider_mdwdb.f_asset_people_c TRGT 
 ON (SRC.instanceid=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN schneider_mdwdb.d_asset LKP 
 ON ( COALESCE(ast.request_id,SRC.assetinstanceid)= LKP.row_id
AND SRC.sourceinstance = LKP.source_id ) where 
COALESCE(LKP.row_key,CASE WHEN COALESCE(ast.request_id,SRC.assetinstanceid) IS NULL THEN 0 else '-1' end)<> (TRGT.asset_key);


 
 