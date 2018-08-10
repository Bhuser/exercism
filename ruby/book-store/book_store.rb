class BookStore
  def self.calculate_price(books)
    Books.new(books).calculate_price
  end
end

class Books
  BOOK_PRICE = 8.0
  BOOK_DISCOUNT = {
      1 => 0,
      2 => 0.05,
      3 => 0.1,
      4 => 0.2,
      5 => 0.25
  }

  def initialize (books)
    @books = books
    @total = 0.0
  end

  def calculate_price
    book_sets(@books).each do |set|
      @total += price(set.size)
    end
    @total
  end

    def book_sets(books)
      books.each_with_object([]) do |book, book_sets|
        add_book(book, book_sets)
      end
    end

    def add_book(book, book_sets)
      # Set priority since sets of 5 have the largest discount
      set_size_priority = { 5 => 0, 4 => 1, 3 => 4, 2 => 3, 1 => 2 }

      if book_sets.all? { |set| set.include?(book) }
        book_sets << [book]
      else
        book_sets.max_by { |set| set_size_priority[set.size] }.push(book)
      end
    end

    def price(books)
      books * BOOK_PRICE * (1 - BOOK_DISCOUNT[books])
    end
end

module BookKeeping
  VERSION = 0
end