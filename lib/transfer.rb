require "pry"

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && @amount <= @sender.balance
  end

  def execute_transaction
    if @status == "pending" && self.valid?
      @sender.deposit(- amount)
      @receiver.deposit(amount)
      @status = "complete"
    elsif !self.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(-amount)
      @sender.deposit(amount)
      @status = "reversed"
    else
      "boo"
    end
  end



end
