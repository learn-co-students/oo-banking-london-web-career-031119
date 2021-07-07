require_relative '../lib/bank_account.rb'


class Transfer 
  

  attr_accessor :sender, :receiver, :status, :amount
  # attr_reader 

  def initialize(sender, receiver, status = "pending", amount)
    
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end


  def valid? # THIS took ages!!!!
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if (@status != "complete" && @sender.balance > @amount)
    @sender.balance = @sender.balance - @amount
    @receiver.balance = @receiver.balance + @amount
    @status = status="complete"
    else
      @status = "rejected"
    return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    fake_receiver = @receiver
    fake_sender = @sender
    @sender = fake_receiver
    @receiver = fake_sender
    if (@status != "pending" && @sender.balance > @amount)
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @status = status="reversed"
    end
  end

end






# def valid?
#   if @sender == true && @receiver == true
#     return true
#   else 
#     return false
#   end
# end