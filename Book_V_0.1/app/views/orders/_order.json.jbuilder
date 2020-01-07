json.extract! order, :id, :name, :phone, :address, :delivery_date, :product_id, :payment_option, :amount, :order_status, :created_at, :updated_at
json.url order_url(order, format: :json)
