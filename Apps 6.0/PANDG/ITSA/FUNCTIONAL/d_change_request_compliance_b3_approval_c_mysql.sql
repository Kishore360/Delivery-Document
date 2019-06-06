SELECT distinct SRC.number as CHG,l1.dimension_name as State,
L.dimension_name as Service_Type,
d.dimension_name as Close_Code,
typ.dimension_name as Type,
Imp.dimension_name as Impact,
Rsk.dimension_name as Risk,
LKP.approval_column
 from png_mdsdb.change_request_final SRC
 
JOIN png_mdwdb.d_lov l1 
ON COALESCE(concat('STATE','~','CHANGE_REQUEST~',SRC.state),'UNSPECIFIED')=l1.row_id 
AND SRC.sourceinstance=l1.source_id

JOIN png_mdwdb.d_lov L
ON concat('SERVICE_TYPE_C~CHANGE_REQUEST~',upper(SRC.u_service_type))= L.row_id 
AND SRC.sourceinstance= L.source_id

JOIN png_mdwdb.d_lov d 
ON CONCAT('CLOSE_CODE','~','CHANGE_REQUEST','~',SRC.close_code)=d.row_id AND SRC.sourceinstance=d.source_id

JOIN png_mdwdb.d_lov typ
ON CONCAT('TYPE','~','CHANGE_REQUEST','~',SRC.type)=typ.row_id AND SRC.sourceinstance=typ.source_id

JOIN png_mdwdb.d_lov Imp
ON CONCAT('IMPACT','~','CHANGE_REQUEST','~',SRC.impact)=Imp.row_id AND SRC.sourceinstance=Imp.source_id

JOIN png_mdwdb.d_lov Rsk
ON CONCAT('RISK','~','CHANGE_REQUEST','~',SRC.risk)=Rsk.row_id AND SRC.sourceinstance=Rsk.source_id

JOIN png_mdwdb.d_calendar_date b
on COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.opened_at,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED') = b.row_id
-- and b.lagging_count_of_month between 0 and 26

JOIN png_mdsdb.sysapproval_approver_final LKP
on SRC.sys_id= LKP.document_id

where b.lagging_count_of_month between 0 and 26 
and SRC.cdctype <> 'D'
and l1.dimension_name in ('Closed')
and L.dimension_name not in ('Non-Production')
and d.dimension_name not in ( 'Withdrawn / Cancelled','Rejected')
and (typ.dimension_name in ('Normal') or (typ.dimension_name in ('Emergency')
and (Imp.dimension_name in ('2 - Medium') or Rsk.dimension_name not in ('Moderate'))))
