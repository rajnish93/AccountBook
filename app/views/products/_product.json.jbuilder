json.extract! product, :id, :rkproductstatus, :rkproductname, :rkproductdescription, :supplier_id, :productcategory_id, :chartaccount_id, :created_at, :updated_at
json.url product_url(product, format: :json)
