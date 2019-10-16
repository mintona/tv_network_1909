require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/character'


class CharacterTest < Minitest::Test

  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
  end

  def test_it_exists
    assert_instance_of Character, @kitt
  end

  def test_it_initializes
    assert_equal "KITT", @kitt.name
    assert_equal "William Daniels", @kitt.actor
    assert_equal 1000000, @kitt.salary
  end

end
