require_relative './bank_account.rb'
require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :bankaccount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 

  def valid?
     @sender.valid? && @receiver.valid? 
  end 

  def execute_transaction
    if valid? && @status == "pending" && @sender.balance > amount 
      @sender.balance -= amount
      @receiver.balance += amount 
      @status = "complete" 
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if @status == "complete"
    @sender.balance += amount
    @receiver.balance -= amount
    @status = "reversed"
    else nil 
    end 
  end 



end
