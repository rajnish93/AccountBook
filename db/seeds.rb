Accountgroup.destroy_all
Chartaccount.destroy_all

# Accountgroup.create!([{
#   rkaccountcode:"100000",
#   rkaccountname:"Share Capital",
#   rkaccounttype:"Liabilities",
# },
# {
#   rkaccountcode:"100001",
#   rkaccountname:"Reserves & Surplus",
#   rkaccounttype:"Liabilities",
# },
# {
#   rkaccountcode:"100002",
#   rkaccountname:"Accumulated Depreciation",
#   rkaccounttype:"Liabilities",
# },
# {
#   rkaccountcode:"100003",
#   rkaccountname:"Secure Loans",
#   rkaccounttype:"Liabilities",
# },
# {
#   rkaccountcode:"100004",
#   rkaccountname:"Unsecured Loans",
#   rkaccounttype:"Liabilities",
# },
# {
#   rkaccountcode:"100005",
#   rkaccountname:"Current Liabilities",
#   rkaccounttype:"Liabilities",
# },
# {
#   rkaccountcode:"100006",
#   rkaccountname:"Bank OD",
#   rkaccounttype:"Liabilities",
# },
# {
#   rkaccountcode:"100007",
#   rkaccountname:"Bank OCC Account",
#   rkaccounttype:"Liabilities",
# },
# {
#   rkaccountcode:"100008",
#   rkaccountname:"Provision",
#   rkaccounttype:"Liabilities",
# },
# {
#   rkaccountcode:"100009",
#   rkaccountname:"Duties & Taxes",
#   rkaccounttype:"Liabilities",
# },
# {
#   rkaccountcode:"100010",
#   rkaccountname:"Sundry Creditors",
#   rkaccounttype:"Liabilities",
# },
# {
#   rkaccountcode:"100011",
#   rkaccountname:"Division",
#   rkaccounttype:"Liabilities",
# },
# {
#   rkaccountcode:"200000",
#   rkaccountname:"Fixed Assets",
#   rkaccounttype:"Assets",
# },
# {
#   rkaccountcode:"200001",
#   rkaccountname:"Investment",
#   rkaccounttype:"Assets",
# },
# {
#   rkaccountcode:"200002",
#   rkaccountname:"Bank Account",
#   rkaccounttype:"Assets",
# },
# {
#   rkaccountcode:"200003",
#   rkaccountname:"Cash in Hand",
#   rkaccounttype:"Assets",
# },
# {
#   rkaccountcode:"200004",
#   rkaccountname:"Stock in Hand",
#   rkaccounttype:"Assets",
# },
# {
#   rkaccountcode:"200005",
#   rkaccountname:"Current Assets",
#   rkaccounttype:"Assets",
# },
# {
#   rkaccountcode:"200006",
#   rkaccountname:"Deposit (Assets)",
#   rkaccounttype:"Assets",
# },
# {
#   rkaccountcode:"200007",
#   rkaccountname:"Loan & Advances (Assets)",
#   rkaccounttype:"Assets",
# },
# {
#   rkaccountcode:"200008",
#   rkaccountname:"Misc. Expenses (Assets)",
#   rkaccounttype:"Assets",
# },
# {
#   rkaccountcode:"200009",
#   rkaccountname:"Sundry Debtors",
#   rkaccounttype:"Assets",
# },
# {
#   rkaccountcode:"300000",
#   rkaccountname:"Sales A/c",
#   rkaccounttype:"Income",
# },
# {
#   rkaccountcode:"300001",
#   rkaccountname:"Direct Income",
#   rkaccounttype:"Income",
# },
# {
#   rkaccountcode:"300002",
#   rkaccountname:"Indirect Income",
#   rkaccounttype:"Income",
# },
# {
#   rkaccountcode:"300003",
#   rkaccountname:"Increase / Deserase in Stock",
#   rkaccounttype:"Income",
# },
# {
#   rkaccountcode:"400000",
#   rkaccountname:"Raw Material Consumption",
#   rkaccounttype:"Expenditure",
# },
# {
#   rkaccountcode:"400001",
#   rkaccountname:"Personnel Cost",
#   rkaccounttype:"Expenditure",
# },
# {
#   rkaccountcode:"400002",
#   rkaccountname:"Manufacturing Cost",
#   rkaccounttype:"Expenditure",
# },
# {
#   rkaccountcode:"400003",
#   rkaccountname:"Administration Cost",
#   rkaccounttype:"Expenditure",
# },
# {
#   rkaccountcode:"400004",
#   rkaccountname:"Interest",
#   rkaccounttype:"Expenditure",
# },
# {
#   rkaccountcode:"400005",
#   rkaccountname:"Depreciation",
#   rkaccounttype:"Expenditure",
# },
# {
#   rkaccountcode:"400006",
#   rkaccountname:"Direct Expenses",
#   rkaccounttype:"Expenditure",
# },
# {
#   rkaccountcode:"400007",
#   rkaccountname:"Purchase A/c",
#   rkaccounttype:"Expenditure",
# },
# {
#   rkaccountcode:"400008",
#   rkaccountname:"Indirect Expenses",
#   rkaccounttype:"Expenditure",
# },
# {
#   rkaccountcode:"400009",
#   rkaccountname:"Marketing",
#   rkaccounttype:"Expenditure",
# },
#
# ])
# p "Created #{Accountgroup.count} accountgroups"


require 'csv'

puts "Importing Account Groups..."
CSV.foreach(Rails.root.join("accountgroups.csv"), headers: true) do |row|
  Accountgroup.create! do |f|
    f.id = row[0]
    f.rkaccountcode = row[1]
    f.rkaccountname = row[2]
    f.rkaccounttype = row[3]
    f.created_at = row[4]
    f.updated_at = row[5]
  end
end


puts "Importing Ledgers..."
CSV.foreach(Rails.root.join("chartaccounts.csv"), headers: true) do |row|
  Chartaccount.create! do |f|
    f.id = row[0]
    f.rkcoacode = row[1]
    f.rkcoaname = row[2]
    f.accountgroup_id = row[3]
    f.created_at = row[4]
    f.updated_at = row[5]
  end
end
