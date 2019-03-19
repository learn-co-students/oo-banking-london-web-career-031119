class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @transfers = []
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance - amount >= 0 && @status != "complete"
      @sender.deposit(-amount)
      @receiver.deposit(amount)
      @status = "complete"
      @transfers << amount
    else
      @status= "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount)
      @receiver.deposit(-amount)
      @status = "reversed"
    end

  end
end
