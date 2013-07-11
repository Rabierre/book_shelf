require 'date'
require 'json'
require File.expand_path(File.dirname(__FILE__) + '/book_meta.rb')

class Book
    attr_accessor :title, :author, :metaData

    def initialize title, author, purchasedDate=Date.new, read=false, open=false
        @title = title
        @author = author
        @metaData = BookMeta.new(purchasedDate, read, open)
    end

    def self.load json
        JSON json
    end

    def to_s
        "\"#{title}\" written by #{author}."
    end

    def read?
        @metaData.read
    end

    def open?
        @metaData.open
    end

    def == other
        title == other.title &&  author == other.author
    end

    def hash
        (title + author).hash
    end

    def to_json (*book)
        {
            "json_class"    => self.class.name,
            "data"          => {
                "title"     => @title,
                "author"    => @author,
                "metaData"  => @metaData
            }
        }.to_json(*book)
    end

    def self.json_create (o)
        new(o["data"]["title"], o["data"]["author"], o["data"]["metaData"])
    end
end

=begin
one = Book.new "A book", "an author", Time.new(2013,7,3).to_date
other = Book.new "A book", "an author", Time.new(2013,5,30).to_date

puts one.to_json
parsed = JSON (one.to_json)
puts parsed.to_s
puts one.== other
print "one's hash : ", one.hash
print "other's hash : ", other.hash
=end