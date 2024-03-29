-- models/dim_contributor.sql
with
    contributor_data as (
        select distinct
            name as contributor_name,
            city,
            state,
            zip_code as zip_code,
            employer,
            occupation
        from {{ source("STAGED", "STA_INDIV") }}
        where
            name is not null
            and city is not null
            and state is not null
            and zip_code is not null
    )

select
    row_number() over (
        order by contributor_name, city, state, zip_code
    ) as contributor_key,
    contributor_name,
    city as city,
    state as state,
    zip_code,
    employer as employer,
    occupation as occupation
from contributor_data
