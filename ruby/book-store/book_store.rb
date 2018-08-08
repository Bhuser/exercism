
class BookStore
    def self.calculate_price(books)
      Books.new(books).calculate_price
    end
end

class Books

  def initialize (books)
    @books = books
    @unique_books = books.uniq
    @dup_books = books #find_duplicates(@books)
    @total = 0.0
  end

  def calculate_price
    return @total if @books.empty?

    puts "books: #{@books}"
    puts "checking dupes: #{@dup_books} and next dupe: #{find_duplicates(@dup_books)}"

    while find_duplicates(@dup_books).length > 0
      @dup_books = find_duplicates(@dup_books)
      @total = @dup_books.length == 1 ? 8 : discount((@dup_books.length * 8), @dup_books)
      puts "total: #{@total}"
    end

    puts "unique: #{@unique_books} total: #{@unique_books.length * 8}"
    @total + (discount((@unique_books.length * 8), @unique_books))

  end

  def find_duplicates (books)
    duplicates = books.select { |e| books.count(e) > 1 }
    duplicates.uniq
  end

  def discount(total, books)
    puts "finding discount: total: #{total} books: #{books}"
    case books.length
    when 1 then total
    when 2 then total - (total * 0.05)
    when 3 then total - (total * 0.10)
    when 4 then total - (total * 0.20)
    when 5 then total - (total * 0.25)
    end
  end

end