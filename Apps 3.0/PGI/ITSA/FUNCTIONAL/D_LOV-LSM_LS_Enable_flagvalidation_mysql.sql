select 
    case
        when count(1) > 0 then 'WARNING'
        else 'SUCCESS'
    end as Result,
    case
        when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov'
        else 'SUCCESS'
    end as Message
from
    (select 
        TGT.dimension_class as d1, SRC.dimension_class as d2
    from
        (select 
        class_value as dimension_class
    from
        pgi_workdb.lsm_ls_system_variables conf
    where
        conf.enable_flag = 'Y') SRC
    left join pgi_mdwdb.d_lov TGT ON TGT.dimension_class = SRC.dimension_class
    where
        TGT.row_id is null
            and SRC.dimension_class not like ('%CATEGORY~FACILITIES%')
			and SRC.dimension_class not like ('%CATEGORY~HR_CHANGE%')
			and SRC.dimension_class not like ('%STATE~HR_CHANGE%')
			and SRC.dimension_class not like ('%REPORTED_TYPE~CALL%')
			and SRC.dimension_class not like ('%CALL_TYPE~CALL%')
					
) a;
