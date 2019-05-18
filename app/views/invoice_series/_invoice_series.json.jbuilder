json.extract! invoice_series, :id, :rkseriesname, :rkseriesvalue, :rkseriesactive, :rkseriesdefault, :created_at, :updated_at
json.url invoice_series_url(invoice_series, format: :json)
