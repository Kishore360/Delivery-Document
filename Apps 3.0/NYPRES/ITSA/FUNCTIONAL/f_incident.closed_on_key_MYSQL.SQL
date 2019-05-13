
  SELECT 
CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_incident.closed_on_key' ELSE 'SUCCESS' END as Message
FROM (  
SELECT Count(1) as CNT 
--  select SRC.number,COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.closed_at,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')erow_id,LKP.row_id,
-- COALESCE(LKP.row_key,CASE WHEN SRC.closed_at is NULL THEN 0 ELSE -1 END)ekey,TRGT.closed_on_key,SRC.sys_created_on,SRC.sys_updated_on,
-- TRGT.dw_inserted_on,TRGT.dw_updated_on,TRGT.created_on,LKP.created_on,LKP.dw_inserted_on,LKP.dw_updated_on,LKP1.dimension_class,LKP1.dimension_name,
-- LKP1.dimension_code
FROM nypres_mdsdb.incident_final SRC
JOIN nypres_mdwdb.f_incident TRGT ON (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
JOIN nypres_mdwdb.d_calendar_date LKP 
ON COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.closed_at,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')=LKP.row_id
JOIN nypres_mdwdb.d_lov LKP1
on TRGT.state_src_key=LKP1.row_key
WHERE case when LKP1.dimension_name!='Closed' then TRGT.closed_on_key<>0 else
COALESCE(LKP.row_key,CASE WHEN SRC.closed_at is NULL THEN 0 ELSE -1 END)<>TRGT.closed_on_key end
and TRGT.soft_deleted_flag='N'
 )a;
 