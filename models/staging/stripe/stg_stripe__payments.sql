
select
    id as payments_id,
    orderid as order_id,
    * except (id, orderid)

from dbt-tutorial.stripe.payment
