require 'page_lister'
require 'test_helper'

class TestPageLister < MiniTest::Test
  def setup
    @line = "/home 225.183.113.22"
    @subject = PageLister.new(@line)
    @log = "/home 225.183.113.22
    /contact/ 245.141.61.189
    /home 225.183.113.22
    /contact/ 61.64.28.106
    /index 122.255.244.161
    /about 138.222.28.220
    /products/3 138.222.28.220
    /about 228.32.104.207
    products/1 117.198.72.249
    /products/2 225.183.113.22
    /about 225.183.113.22
    /products/2 83.104.119.23
    /products/2 155.231.213.36
    /home 245.141.61.189"
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
