# ruby-so-colissimo


A Ruby library for interacting with So Colissimo SOAP-based API 

### How to use?

First of all create in your config folder in your Rails App a file called, so_colissimo.yml and copy/paste the content of the example. Change it with your credentials received from So Colissimo.

When the plugin is loaded, you can use it as in this example : 

    SoColissimo::Point.search({
       :zip_code => @order.billing_address_postal_code, 
       :city => @order.billing_address_city, 
       :shipping_date => (@order.created_at + 1.week).to_s(:so_colissimo) }, 
       [:zip_code, :city, :shipping_date]
     )
 
We have to pass also an order in which the variables are send to the api because using a Hash in ruby 1.8.7 will change the order of the variables randomly and this is not accepted by the So Colissimo SOAP Api.