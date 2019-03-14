class Transfer
  attr_reader :status
  attr_accessor  :sender, :receiver, :amount

    def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    end

    def valid?
      @sender.valid? && receiver.valid?
    #binding.pry
    end

    def execute_transaction
      if (@sender.balance - @amount) >= 0 && @status == "pending" 
        @receiver.deposit(@amount)
        @sender.deposit(-@amount) 
        @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if @status == 'complete'
        @sender.deposit(@amount)
        @receiver.deposit(-@amount)
        @status = "reversed"  
      end
    end
    
end
