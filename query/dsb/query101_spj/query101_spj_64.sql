
select min(c_customer_sk), min(ss_item_sk), min(sr_ticket_number), min(ws_order_number)
FROM
store_sales,
store_returns,
web_sales,
date_dim d1,
date_dim d2,
item,
customer,
customer_address,
household_demographics
WHERE
ss_ticket_number = sr_ticket_number
AND ss_customer_sk = ws_bill_customer_sk
AND ss_customer_sk = c_customer_sk
AND c_current_addr_sk = ca_address_sk
AND c_current_hdemo_sk = hd_demo_sk
AND ss_item_sk = sr_item_sk
AND sr_item_sk = ws_item_sk
AND i_item_sk = ss_item_sk
AND i_category IN ('Children', 'Jewelry', 'Men')
AND sr_returned_date_sk = d1.d_date_sk
AND ws_sold_date_sk = d2.d_date_sk
AND d2.d_date between d1.d_date AND (d1.d_date + interval '90 day')
AND ca_state in ('FL', 'MO', 'MS', 'NY', 'WY')
AND d1.d_year = 1998
AND hd_income_band_sk BETWEEN 20 AND 26
AND hd_buy_potential = '0-500'
AND ss_sales_price / ss_list_price BETWEEN 1 * 0.01 AND 21 * 0.01
;


