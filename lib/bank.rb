# frozen_string_literal: true

require_relative 'client'
# Bank class collects and stores clients
class Bank
  attr_reader :clients

  def initialize
    @clients = []
  end

  def new_client(name, client = Client)
    @clients.push(client.new(name))
  end
end
