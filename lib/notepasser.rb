require "notepasser/version"
require "notepasser/init_db"
require "camping"
require "pry"

Camping.goes :Notepasser

module Notepasser
  module Notepasser::Models
    class User < ActiveRecord::Base
      #validates :name, presence :true <- add uniqueness
      has_many :messages
    end

    class Message < ActiveRecord::Base
      # validates :user_id, presence: true <- ?? Read up on validations again
      belongs_to :user
    end
  end
end

module Notepasser::Controllers
  class Index < R '/'
    def get
      "Welcome to Notepasser 1.0!"
    end
  end

  class MessageController < R '/message/' # Add regex?
    def get(message_id)
      message = Notepasser::Models::Message.find(message_id)
      message.to_json
    rescue ActiveRecord::RecordNotFound
      @status = 404
      "404 - message not found :("
    end

    def delete(message_id)
      message = Notepasser:Models::Message.find(message_id)
      message.destroy
      @status = 204
    rescue ActiveRecord::RecordNotFound
      @status= 404
      "No message to delete"
    end
  end
end
