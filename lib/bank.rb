require 'client'

class Bank

  attr_reader :clients
  
  def initialize
    @clients = Array.new
  end 
  
  
  def new_client(name)
    @clients.push(Client.new(name))
  end

end