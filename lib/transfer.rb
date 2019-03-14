class Transfer
  # your code here
    attr_reader :sender, :receiver, :amount, :status
    # attr_accessor :balance, :status

    @@all = []

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"

      @@all << self
    end

    def valid?
      @sender.valid? && @receiver.valid?
    end

    def execute_transaction
    if @status == "pending" && self.valid? && ((@sender.balance - @amount) >= 0)
      @sender.balance = (@sender.balance - @amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance = (@receiver.balance - @amount)
      @sender.balance = (@sender.balance + @amount)
      @status = "reversed"
    end
  end
end
