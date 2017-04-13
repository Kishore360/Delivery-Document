 SELECT 
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
   FROM  <<tenant>>_mdsdb.incident_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  LEFT JOIN  <<tenant>>_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
 
LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key and LM.dimension_class='STATE~INCIDENT'


 WHERE LM.dimension_wh_code IN('RESOLVED') and 
 CASE WHEN
-- <<<<<<< HEAD
 TIMESTAMPDIFF(MINUTE,coalesce(SRC.opened_at,'1970-01-01 00:00:00'), SRC.resolved_at)<30
  THEN 'Y' ELSE 'N' END  <> (TRGT.first_call_resolution_flag ))a
-- =======
-- LM.dimension_wh_code IN('RESOLVED','CLOSED') 
-- AND TIMESTAMPDIFF(MINUTE,coalesce(SRC.opened_at,'1970-01-01 00:00:00'), coalesce(SRC.resolved_at,SRC.closed_at,SRC.sys_updated_on))<30
-- THEN 'Y' ELSE 'N' END  <> COALESCE(TRGT.first_call_resolution_flag ,''))temp;
-- >>>>>>> c7bfeaa6c218a7189df0320b4c059663b1d717ca
