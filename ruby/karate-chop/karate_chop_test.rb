require 'minitest/autorun'
require 'minitest/pride'
require_relative 'karate_chop'

# Common test data version: 1.1.0 a636903
class KarateChopTest < Minitest::Test
  def test_chop
    assert_equal(-1, KarateChop.chop(3, []))
    assert_equal(-1, KarateChop.chop(3, [1]))
    assert_equal(0,  KarateChop.chop(1, [1]))
    #
    assert_equal(0,  KarateChop.chop(1, [1, 3, 5]))
    assert_equal(1,  KarateChop.chop(3, [1, 3, 5]))
    assert_equal(2,  KarateChop.chop(5, [1, 3, 5]))
    assert_equal(-1, KarateChop.chop(0, [1, 3, 5]))
    assert_equal(-1, KarateChop.chop(2, [1, 3, 5]))
    assert_equal(-1, KarateChop.chop(4, [1, 3, 5]))
    assert_equal(-1, KarateChop.chop(6, [1, 3, 5]))
    #
    assert_equal(0,  KarateChop.chop(1, [1, 3, 5, 7]))
    assert_equal(1,  KarateChop.chop(3, [1, 3, 5, 7]))
    assert_equal(2,  KarateChop.chop(5, [1, 3, 5, 7]))
    assert_equal(3,  KarateChop.chop(7, [1, 3, 5, 7]))
    assert_equal(-1, KarateChop.chop(0, [1, 3, 5, 7]))
    assert_equal(-1, KarateChop.chop(2, [1, 3, 5, 7]))
    assert_equal(-1, KarateChop.chop(4, [1, 3, 5, 7]))
    assert_equal(-1, KarateChop.chop(6, [1, 3, 5, 7]))
    assert_equal(-1, KarateChop.chop(8, [1, 3, 5, 7]))
  end
end