SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(*) as cnt 
from schneider_mdwdb.d_internal_organization a 
where CASE WHEN a.row_key!='-1' then 'UNSPECIFIED' end<>a.organization_contact_name)a;