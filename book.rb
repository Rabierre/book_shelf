require 'date'
require "json"

class Book
	attr_accessor :title, :author, :datePurchased, :read, :open

	def initialize title, author, datePurchased=Date.new, read=false, open=false
		@title = title
		@author = author
		@datePurchased = datePurchased
		@read = read
		@open = open
	end

	def self.load json
		JSON.parse json
	end

    def to_s
        "\"#{title}\" written by #{author}."
    end

    def eql? other
    	title == other.title &&  author == other.author
    end

    def hash
    	(title + author).hash
    end

    def to_json (*book)
    	{
    		"json_class" 	=> self.class.name,
    		"data"			=> {
    			"title"		=> @title,
    			"author"	=> @author,
    			"datePurchased"	=> @datePurchased,
    			"read"		=> @read,
    			"open"		=> @open
    		}
	    }.to_json(*book)	# What is this???
    end

    def self.json_create (o)
    	new(o["data"]["title"], o["data"]["author"], o["data"]["datePurchased"], o["data"]["read"], o["data"]["open"])
    end
end

#one = Book.new "A book", "an author", Time.new(2013,7,3).to_date
#other = Book.new "A book", "an author", Time.new(2013,5,30).to_date

#puts one.to_json
#puts JSON.parse(one.to_json)

#puts one.eql? other
#print "one's hash : ", one.hash
#print "other's hash : ", other.hash