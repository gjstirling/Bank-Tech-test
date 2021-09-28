require 'client'

class Bank

  attr_reader :clients
  
  def initialize
    @clients = Array.new
  end 
  
  def new_client(client)
    @clients.push(client)
  end

end