class BillingPartners
  def process_data
    file_process
  end

  private

  def file_name
    "assets/investments.txt"
  end

  def billing_data
    data = "name, email, company, profit\n"

    5.times do
      name = Faker::Name.name 
      email = Faker::Internet.email
      company = Faker::Company.name
      profit = Faker::Number.decimal(l_digits: 3, r_digits: 2)

      data += "#{name}, #{email}, #{company}, #{profit}\n"
    end

    data
  end

  def file_process
    FileProcess.process_file(file_name, billing_data)
  end
end