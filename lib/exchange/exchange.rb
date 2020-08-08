require 'rest-client'
require 'json'

class Exchange
  API_URL = "https://currencydatafeed.com/api/data.php"
  API_KEY = "s82ejwtm1u7ka1abgms5"

  def initialize(source_currency, target_currency, amount)
    @source_currency = source_currency
    @target_currency = target_currency
    @amount = amount.to_f
  end

  def perform
    begin
      exchange_api_url = API_URL
      exchange_api_key = API_KEY
      
      url = "#{exchange_api_url}?token=#{exchange_api_key}&currency=#{@source_currency}/#{@target_currency}"
      puts "#" * 100
      puts url
      request = RestClient.get url

      puts "#" * 100
      puts request

      puts "#" * 100
      puts request.body
      value = JSON.parse(request.body)['currency'][0]['value'].to_f
      
      value * @amount
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end