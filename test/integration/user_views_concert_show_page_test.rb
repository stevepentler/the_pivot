require 'test_helper'

class UserViewsConcertTest < ActionDispatch::IntegrationTest
  test "guest views concert from root path" do
    category = create(:category)
    venue = create(:venue, status: 1)
    concert = create(:concert, venue: venue, category: category)
    visit root_path
    click_on "#{concert.band}"
    assert_equal venue_concert_path(concert.venue.url, concert.url), current_path
    assert page.has_content?(concert.date)
    assert page.has_content?("Logo")
    assert page.has_content?(concert.band)
    assert page.has_content?(concert.venue.name)
    assert page.has_content?(concert.price)
    assert page.has_content?("Quantity")

  end
end
