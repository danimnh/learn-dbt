{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "dbo",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('users_7_ab3') }}

{% set age_category = ["ADULT","KID"] %}
select
    {{ adapter.quote('id') }},
    sid as account_id,
    character_id as avatar_id,
    uuid,
    {{ adapter.quote('name') }},
    gender,
    bod as date_of_birth,
    country,
    mobile as phone_number,
    case when is_kids = 0 then 'ADULT' else 'KID' end as age_category,
    join_date::timestamp with time zone as created_at,
    join_date::timestamp with time zone as updated_at,
    deleted_at::timestamp with time zone as deleted_at,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_users_7_hashid
from {{ ref('users_7_ab3') }}
-- users_7 from {{ source('dbo', '_airbyte_raw_users_7') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

