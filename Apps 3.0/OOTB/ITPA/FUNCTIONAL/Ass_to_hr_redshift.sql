

/11111No. of HR changes by opened by111/
SELECT
D.full_name
,count(1)
FROM 
<<tenant>>_mdwdb.f_hr_change HR
 inner JOIN  <<tenant>>_mdwdb.d_internal_contact D
 ON HR.assigned_to_key=D.ROW_KEY
 -- and HR.soft_deleted_flag='N'
group by D.full_name
order by D.full_name;
