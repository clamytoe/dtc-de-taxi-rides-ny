{{ config(materialized='table') }}

with fhv_data as (
    select *, 
        'Fhv' as service_type
    from {{ ref('stg_fhv_tripdata') }}
)
select 
    fhv_data.tripid, 
    fhv_data.pickup_locationid, 
    fhv_data.dropoff_locationid,
    fhv_data.pickup_datetime, 
    fhv_data.dropoff_datetime, 
    fhv_data.sr_flag, 
    fhv_data.affiliated_base_number 
from fhv_data