class BankAccount
    attr_accessor :balance, :status
    attr_reader :name


    def initialize(name, balance=1000, status = "open")
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(ammount)
        @balance += ammount
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def valid?
        if @balance >= 1 && @status == "open"
            return true
        else
            return false
        end
    end

    def close_account
        @status = "closed"
    end

end


# def valid?
#     if @balance >= 1 && @status == "open"
#         return true
#     else
#         return false
#     end
# end