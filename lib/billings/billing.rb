class Billing
  attr_accessor :name, :email, :company, :profit
  
  def initialize(name, email, company, profit)
    @name = name
    @email = email
    @company = company
    @profit = profit
  end

  def add_billing_line
    file_process
  end

  private

  def file_process
    FileProcess.add_line(file_name, line_data)
  end

  def file_name
    "assets/investments.txt"
  end

  def line_data
    "#{name}, #{email}, #{company}, #{profit}\n"
  end
end