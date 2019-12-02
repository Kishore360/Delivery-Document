
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
( select count(1) as cnt
from
wpl_mdwdb.f_incident dfi
JOIN wpl_mdsdb.incident_final incf ON dfi.row_id = incf.sys_id AND dfi.source_id= incf.sourceinstance
join
wpl_mdwdb.d_lov lkp
on COALESCE(CONCAT('U_BUSINESS_CRITICALITY~INCIDENT~',UPPER(incf.u_business_criticality)),'UNSPECIFIED')=lkp.row_id
where coalesce(lkp.row_key,case when incf.u_business_criticality is null then 0 else -1 end )<>dfi.business_service_criticality_src_c_key
and incf.cdctype='X')a
  
  
  