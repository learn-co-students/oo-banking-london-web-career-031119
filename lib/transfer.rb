require_relative './bank_account.rb'


class Transfer
attr_accessor :transfer, :sender, :receiver, :amount, :status



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
  # if @sender.balance > @amount
  if (@status != "complete" && @sender.balance > @amount)
  @sender.balance = @sender.balance - @amount
  @receiver.balance = @receiver.balance + @amount
  @status = "complete"
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
      @status = "reversed"
end
end


end
