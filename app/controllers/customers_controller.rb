class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def alphabetized
    @customers = Customer.all.order("full_name")
  end

  def missing_email
    @customers = Customer.all.where("email_address = ''")
  end
end
