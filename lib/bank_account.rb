require "pry"
class BankAccount

    attr_writer :deposit
    attr_reader :name
    attr_accessor :balance ,:status

def initialize(name)
@name = name 
@balance = 1000
@status = 'open'
# binding.pry
end

def deposit(savings)
self.balance += savings
end

def display_balance
 "Your balance is $#{@balance}."
end

def valid?
    if @balance > 0  && @status == 'open'
       true 
    else
        false
    end
end
    
def close_account
    @status = "closed"
end

end
#binding.pry
avi =BankAccount.new("Avi")
avi.deposit(1000)
# binding.pry
avi.balance
avi.valid? 

# p1 =BankAccount.new("Amanada") 
