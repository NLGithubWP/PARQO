
i_category IN ('Children', 'Electronics', 'Jewelry')
ca_state in ('CA', 'MN', 'SC', 'TX', 'VA')
d1.d_year = 1999
hd_income_band_sk BETWEEN 6 AND 12 AND hd_buy_potential = '501-1000'
ss_sales_price / ss_list_price BETWEEN 6 * 0.01 AND 26 * 0.01

;


