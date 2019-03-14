require "pry"

class Transfer
  # your code here
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
    
    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
    end
    
    def valid?
      if @sender.valid? && @receiver.valid?
        return true
      else
        return false
      end
    end
    
    def execute_transaction
      if @sender.valid? && @sender.balance > amount
        if @status == "pending"
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
        end 
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
end 

def reverse_transfer
  if @status == "complete"
  @receiver.balance -= amount
  @sender.balance += amount
  @status = "reversed"
end
end
    
end
