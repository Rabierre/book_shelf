require 'date'

class BookMeta
    attr_accessor :purchasedDate, :read, :open

    def initialize purchasedDate, read, open
        @purchasedDate = purchasedDate
        @read = read
        @open = open
    end

    def to_json (*m)
        {
            "json_class"    => self.class.name,
            "data"          => {
                "purchasedDate" => @purchasedDate,
                "read"          => @read,
                "open"          => @open               
            }
        }.to_json(*m)
    end
end