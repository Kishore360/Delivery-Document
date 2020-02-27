SELECT  SRC.number,SRC.assignment_group ,LKP.name,CASE WHEN SRC.assignment_group is NULL THEN 'UNSPECIFIED' WHEN LKP.name is NULL THEN 'UNKNOWN' ELSE  LKP.name END Assignment_group,
LKP1.name ,LKP.u_vendor,LKP1.sys_id,CASE WHEN SRC.assignment_group is NULL THEN 'UNSPECIFIED' WHEN LKP.u_vendor is NULL THEN 'UNSPECIFIED' 
WHEN LKP.name is NULL THEN 'UNKNOWN' Else LKP1.name end as Vendor
-- ,count(1) as cnt  
FROM rogersdev6_mdsdb.incident_final SRC  
LEFT JOIN rogers6_mdsdb.sys_user_group_final LKP 
ON  (SRC.assignment_group = LKP.sys_id AND SRC.sourceinstance = LKP.sourceinstance ) 
left join rogers6_mdsdb.core_company_final LKP1
on (LKP.u_vendor = LKP1.sys_id AND LKP.sourceinstance = LKP1.sourceinstance ) ;

SELECT  SRC.number,SRC.assignment_group ,LKP.name,CASE WHEN SRC.assignment_group is NULL THEN 'UNSPECIFIED' WHEN LKP.name is NULL THEN 'UNKNOWN' ELSE  LKP.name END Assignment_group,
LKP1.name ,CASE WHEN LKP.name is NULL THEN 'UNKNOWN' WHEN LKP.u_vendor is NULL THEN 'UNSPECIFIED' 
 Else LKP1.name end as Vendor
-- ,count(1) as cnt  
FROM rogersdev6_mdsdb.problem_final SRC  
LEFT JOIN rogers6_mdsdb.sys_user_group_final LKP 
ON  (SRC.assignment_group = LKP.sys_id AND SRC.sourceinstance = LKP.sourceinstance ) 
left join rogers6_mdsdb.core_company_final LKP1
on (LKP.u_vendor = LKP1.sys_id AND LKP.sourceinstance = LKP1.sourceinstance ) 
where SRC.number in ('PRB0005937','PRB0005949','PRB0005479','PRB0006042','PRB0002466') ;

SELECT  SRC.number,SRC1.number,SRC.u_assignment_group_for_pit_lead ,LKP.name,CASE WHEN SRC.u_assignment_group_for_pit_lead is NULL THEN 'UNSPECIFIED' 
WHEN LKP.name is NULL THEN 'UNKNOWN' ELSE  LKP.name END Assignment_group,
LKP1.name ,CASE WHEN SRC.u_assignment_group_for_pit_lead is NULL THEN 'UNSPECIFIED'  
when LKP.name is NULL THEN 'UNKNOWN' WHEN LKP.u_vendor is NULL THEN 'UNSPECIFIED' 
 Else LKP1.name end as Vendor
-- ,count(1) as cnt  
FROM rogers6_mdsdb.problem_final SRC  
right join rogers6_mdsdb.incident_final SRC1
on   (SRC.sys_id = SRC1.problem_id AND SRC.sourceinstance = SRC1.sourceinstance ) 
LEFT JOIN rogers6_mdsdb.sys_user_group_final LKP 
ON  (SRC.u_assignment_group_for_pit_lead = LKP.sys_id AND SRC.sourceinstance = LKP.sourceinstance ) 
left join rogers6_mdsdb.core_company_final LKP1
on (LKP.u_vendor = LKP1.sys_id AND LKP.sourceinstance = LKP1.sourceinstance ) 
where SRC1.number in ('INC0018059','INC1156508','INC1325126','INC1428617') ;