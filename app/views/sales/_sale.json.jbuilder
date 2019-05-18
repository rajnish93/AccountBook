json.extract! sale, :id, :rksaleinvoice, :rksaledate, :rksaleduedate, :customer_id, :product_id, :employee_id, :accountjournal_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
