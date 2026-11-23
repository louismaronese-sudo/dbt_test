with orders as (

    select * from {{ref("stg_jaffle_shop__orders")}}


),

payments as (

    select * from {{ref("stg_stripe__payments")}}
    where payment_status = 'success'

),

final as (
    
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        payments.payment_amount
    

    from orders

    left join payments using (order_id)

)

select * from final