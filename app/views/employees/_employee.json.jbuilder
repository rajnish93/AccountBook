json.extract! employee, :id, :rkactive, :rkempcode, :rkempname, :rkempgender, :department_id, :rkhiredate, :created_at, :updated_at
json.url employee_url(employee, format: :json)
