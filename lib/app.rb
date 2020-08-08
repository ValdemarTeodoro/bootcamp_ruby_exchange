require 'faker'

require_relative 'file_process/file_process'
require_relative 'billings/billing_partners'
require_relative 'billings/billing'

billing_partners = BillingPartners.new
billing_partners.process_data

billing = Billing.new("Leonard Mackenzie", Faker::Internet.email, Faker::Company.name, Faker::Number.decimal(l_digits: 3, r_digits: 2))
billing.add_billing_line
