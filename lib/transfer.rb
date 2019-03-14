require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status


    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"

    end

    def valid?
      @sender.valid? && @receiver.valid?
    end

    def execute_transaction

      if @status == "pending" && @sender.valid? && ((@sender.balance - @amount) >= 0)

          @sender.balance -= @amount
          @receiver.deposit(@amount)
          @status = "complete"

      else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if @status == "complete"
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
      end
    end
end

# amanda = Transfer.new(amanda, avi, 50)


# binding.pry
