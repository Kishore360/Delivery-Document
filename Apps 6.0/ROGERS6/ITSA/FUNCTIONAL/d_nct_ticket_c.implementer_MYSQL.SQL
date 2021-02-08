

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_nct_ticket_c.implementer' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM rogers6_mdwdb.d_nct_ticket_c TRGT 
JOIN 
(

SELECT  implementer_email_domain_c, implementer_cnt, implementer_c, implementer_email_cnt, nct_ticket_c_key, implementer_department_c, implementer_dept_cnt
FROM 
(
SELECT 
MAX(SUBSTR(X.resource_email_c,LOCATE('@',X.resource_email_c)+1)) AS implementer_email_domain_c,
Count(Distinct(X.resource_assignment_c)) AS implementer_cnt,
MAX(X.resource_assignment_c) AS implementer_c,
Count(Distinct(SUBSTR(X.resource_email_c,LOCATE('@',X.resource_email_c)+1))) AS implementer_email_cnt,
X.nct_ticket_c_key AS nct_ticket_c_key,
MAX(X.resource_department_c) AS implementer_department_c,
Count(Distinct(X.resource_department_c)) AS implementer_dept_cnt
FROM rogers6_mdwdb.d_com_tasks_c X
JOIN 
(
Select MAX(a.created_on) AS created_on,
a.nct_ticket_c_key AS nct_key
From rogers6_mdwdb.d_com_tasks_c a 
Where (a.sourceform ='NCT:TICKET'  AND CEIL(a.status_c) NOT IN (90,99)
AND a.category_c='Implementer' AND a.soft_deleted_flag='N' AND a.nct_ticket_c_key > 0 ) Group by 2
) Y ON X.nct_ticket_c_key=Y.nct_key AND X.created_on=Y.created_on
WHERE X. sourceform='NCT:TICKET' AND CEIL(X.status_c) NOT IN (90,99) AND X.category_c='Implementer' AND  X.soft_deleted_flag='N'
AND X.nct_ticket_c_key > 0 Group by 5
) SRC 
) B ON TRGT.row_key=B.nct_ticket_c_key
WHERE CASE WHEN B.implementer_cnt > 1 THEN '#MULTIVALUE' ELSE B.implementer_c END <> TRGT.implementer

) temp;


 