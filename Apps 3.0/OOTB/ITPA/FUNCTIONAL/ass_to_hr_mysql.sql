

SELECT
case when D.row_key is null then 'UNKNOWN' 
when  D.row_key ='0' then 'UNSPECIFIED' 
else D.full_name end as full_name
,count(1)
FROM 
<<tenant>>_mdsdb.hr_change_final HR
 left outer JOIN  <<tenant>>_mdwdb.d_internal_contact D
 ON coalesce(concat('INTERNAL_CONTACT~',HR.assigned_to),'UNSPECIFIED' )=D.ROW_id
 -- and FTC.soft_deleted_flag='N'
group by D.full_name

order by coalesce(D.full_name,'UNSPECIFIED' )  ;
