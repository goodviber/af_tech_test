require 'page_lister'
require 'test_helper'

class TestPageLister < MiniTest::Test
  def setup
    @line = "/home 225.183.113.22"
    @subject = PageLister.new(@line)
  end

  def test_it_instantiates_a_page_lister
    assert_instance_of PageLister, @subject
  end

  def test_yield_page_views_returns_a_hash
   result = @subject.yield_page_for_page_views(h={})
   assert_instance_of Hash, result
   assert_equal({"/home" => 1}, result)
  end

  def test_yield_unique_views_returns_a_hash
   result = @subject.yield_page_for_unique_views(h={})
   assert_instance_of Hash, result
   assert_equal({"/home 225.183.113.22" => 1}, result)
  end

end
