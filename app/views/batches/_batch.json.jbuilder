json.extract! batch, :id, :rkbatchstatus, :rkbatchno, :product_id, :rkbatchstock, :rkbatchpacking, :rkbatchpurchaserate, :rkbatchsalerate, :rkbatchwholesalerate, :rkbatchexpiry, :rkbatchmrp, :created_at, :updated_at
json.url batch_url(batch, format: :json)
