
class BookStore
  def self.calculate_price(books)
    Books.new(books).calculate_price
  end
end

class Books

  def initialize (books)
    @books = books
    @dup_books = books
    @total = 0.0
  end

  def calculate_price
    return @total if @books.empty?

    while has_duplicates(@dup_books).any?
      @dup_books = find_duplicates(@dup_books)
    end
    @total + (discount((@books.uniq.length * 8), @books.uniq))
  end

  def find_duplicates (books)
    duplicates = books.select { |e| books.count(e) > 1 }.uniq
    # puts "DUPLICATES: #{duplicates}"
    @total = @total + discount((duplicates.length * 8), duplicates)
    duplicates.each do |d|
      books.delete_at(books.index(d))
    end
    books
  end

  def has_duplicates (books)
    books.select { |e| books.count(e) > 1 }.uniq
  end

  def discount(total, books)
    case books.length
    when 1 then total
    when 2 then total - (total * 0.05)
    when 3 then total - (total * 0.10)
    when 4 then total - (total * 0.20)
    when 5 then total - (total * 0.25)
    end
  end
end

module BookKeeping
  VERSION = 0
end

# class BookStore
#   def self.calculate_price(books)
#     Books.new(books).calculate_price
#   end
# end
#
# class Books
#   BOOK_PRICE = 8.0
#   BOOK_DISCOUNT = {
#       1 => 0,
#       2 => 0.05,
#       3 => 0.1,
#       4 => 0.2,
#       5 => 0.25
#   }
#
#   def initialize (books)
#     @books = books
#     @total = 0.0
#   end
#
#   def calculate_price
#     book_sets(@books).each do |set|
#       @total += price(set.size)
#     end
#     @total
#   end
#
#   def book_sets(books)
#     books.each_with_object([]) do |book, book_sets|
#       add_book(book, book_sets)
#     end
#   end
#
#   def add_book(book, book_sets)
#     # Set priority since sets of 5 have the largest discount
#     set_size_priority = { 5 => 0, 4 => 1, 3 => 4, 2 => 3, 1 => 2 }
#
#     if book_sets.all? { |set| set.include?(book) }
#       book_sets << [book]
#     else
#       book_sets.max_by { |set| set_size_priority[set.size] }.push(book)
#     end
#   end
#
#   def price(books)
#     books * BOOK_PRICE * (1 - BOOK_DISCOUNT[books])
#   end
# end
#
# module BookKeeping
#   VERSION = 0
# end