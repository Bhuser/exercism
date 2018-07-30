module BookKeeping
  VERSION = 2
end

class Board
	def initialize(board)
   @board = board
   # puts "board #{board}"
   # Remove spaces so we are only left with values from each row
    o = board.map {|row| row.gsub(/ /, '').split('') }
    x = o.transpose
    # Create boards with x,y coords and values
    @oValues = piecesFor(createBoard(o), 'O')
    @xValues = piecesFor(createBoard(x), 'X')
   # The goal x coordinate. Winners go from 0 to this point.
   @goal = o.first.length - 1
	end

	def winner
    return "X" if calculateWinner(@xValues)
    return "O" if calculateWinner(@oValues)
    ""
  end

  def calculateWinner (pieces)
    initialPieces = pieces.select { |p| p.first == 0 }
    initialPieces.any? { |p| adjacent?(p, pieces) }
  end

  def adjacent? (piece, pieces)
    (x,y) = piece
    # puts "cords  (#{x},#{y}) and goal: #{@goal}"
    return true if x == @goal

    # quit if no more items
    nextItem = findAdjacents(x, y, pieces)
    return false if nextItem.length == 0

    # remove current piece so no circular references
    pieces.delete(piece)
    # Keep searching until we hit a condition above
    nextItem.any? { |nextPiece| adjacent?(nextPiece, pieces)}
  end

  def findAdjacents (x, y, pieces)
    adjacentCoords = [
        [x + 1, y],
        [x - 1, y],
        [x, y + 1],
        [x, y - 1],
        [x + 1, y - 1],
        [x - 1, y + 1]
    ]
    pieces.select do |(px, py)|
      adjacentCoords.any? { |(ax, ay)| px == ax && py == ay }
    end
  end

  def piecesFor(board, player)
    board.select { |p| p.last == player }
  end

  def createBoard(board)
    pieces = []
    b = (board.length - 1)
    (0..b).each do |x|
        (0..b).each do |y|
        value = board[x][y]
        pieces.push([x, y, value])
        end
    end
    pieces
  end

end

board = [
    'O . O . .',
    ' O . O . X',
    '  O X O X .',
    '   O O X . .',
    '    X O O O O'
]
game = Board.new(board)
puts "The winner is: #{game.winner}"
