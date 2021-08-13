Tables Accessed:
D_CREDIT_SCORE_CAUSED_BY_CHANGE_C
D_INCIDENT
F_INCIDENT_CREDIT_SCORE_DETAIL
d_internal_organization_group

Select 'F_INCIDENT_CREDIT_SCORE_DETAIL',count(1) as Row_Count 
From ldb.F_INCIDENT_CREDIT_SCORE_DETAIL
UNION 
Select 'D_INCIDENT',count(1) as Row_Count 
From ldb.F_INCIDENT_CREDIT_SCORE_DETAIL a 
JOIN ldb.D_INCIDENT b ON a.incident_key=b.row_key 
UNION 
Select 'd_internal_organization_group',count(1) as Row_Count 
From ldb.F_INCIDENT_CREDIT_SCORE_DETAIL a 
JOIN ldb.d_internal_organization_group b ON a.ASSIGNMENT_GROUP_KEY=b.row_key 
UNION 
Select 'D_CREDIT_SCORE_CAUSED_BY_CHANGE_C',count(1) as Row_Count 
From ldb.F_INCIDENT_CREDIT_SCORE_DETAIL a 
JOIN ldb.D_CREDIT_SCORE_CAUSED_BY_CHANGE_C b ON a.CREDIT_SCORE_CHANGE_REQUEST_C_KEY=b.row_key 
