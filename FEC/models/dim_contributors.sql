-- models/dim_contributor.sql
with
    contributor_data as (
        select distinct
            name as contributor_name,
            city,
            state,
            zip_code,
            employer,
            occupation,
            TRANSACTION_TP as transaction_type,
            TRANSACTION_AMT as transaction_amount,
            TRAN_ID as transaction_id
        from {{ source("STAGED", "STA_INDIV") }}
        where
            name is not null
            and city is not null
            and state is not null
            and zip_code is not null
            -- Assuming you might also want to filter out null transactions, if not remove this line
            and TRANSACTION_TP is not null
            and TRANSACTION_AMT is not null
            and TRAN_ID is not null
    )

select
    row_number() over (
        order by contributor_name, city, state, zip_code
    ) as contributor_key,
    contributor_name,
    city,
    state,
    zip_code,
    employer,
    occupation,
    transaction_type,
    transaction_amount,
    transaction_id
from contributor_data
