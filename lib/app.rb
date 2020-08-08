require 'faker'

require_relative 'file_process/file_process'
require_relative 'billings/billing_partners'
require_relative 'billings/billing'
require_relative 'exchange/exchange'
require_relative 'exchange/exchange_file'

billing_partners = BillingPartners.new
billing_partners.process_data

billing = Billing.new("Leonard Mackenzie", Faker::Internet.email, Faker::Company.name, Faker::Number.decimal(l_digits: 3, r_digits: 2))
billing.add_billing_line

value = 123.45
value_exchanged = Exchange.new('USD', 'BRL', value).perform
puts value
puts value_exchanged

puts "\n"
puts "\n"
puts "\n"
puts ">" * 100
file = "assets/investments.txt"
exchange_file = ExchangeFile.new
data = exchange_file.read_and_process_file(file)
exchange_file.process_info(file, data)

puts "\n"
puts "\n"
puts "\n"
puts "." * 100
puts File.open(file).read