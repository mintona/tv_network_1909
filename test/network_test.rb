require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/character'
require_relative '../lib/show'
require_relative '../lib/network'

class NetworkTest < Minitest::Test

  def setup
    @nbc = Network.new("NBC")

    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})

    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])

    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})

    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])

  end

  def test_it_exists
    assert_instance_of Network, @nbc
  end

  def test_it_initializes
    assert_equal "NBC", @nbc.name
    assert_equal [], @nbc.shows
  end

  def test_it_can_add_shows

    assert_equal [], @nbc.shows

    @nbc.add_show(@knight_rider)

    assert_equal 1, @nbc.shows.length

    @nbc.add_show(@parks_and_rec)

    assert_equal 2, @nbc.shows.length

    assert_equal true, @nbc.shows.include?(@knight_rider)
    assert_equal true, @nbc.shows.include?(@parks_and_rec)

    assert_equal false, @nbc.shows.include?(@the_bachelor)
  end

  def test_it_can_find_highest_paid_actor

    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal "Amy Poehler", @nbc.highest_paid_actor
  end

end
