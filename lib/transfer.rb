class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount  = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > @amount
  end

  def execute_transaction
    if @status == "pending" && self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif !self.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && @receiver.balance > amount
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
