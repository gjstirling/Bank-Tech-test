require 'client'

class Bank

  attr_reader :clients
  
  def initialize
    @clients = Array.new
  end 
  
  def new_client(name, client=Client)
    @clients.push(client.new(name))
  end

end