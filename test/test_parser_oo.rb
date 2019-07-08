require 'parser_oo'
require 'test_helper'
require 'tempfile'

class TestParserOo < MiniTest::Test

    def setup
      @weblog = "data/webserver.log"
      @subject = ParserOo.new(@weblog)
      @templog = Tempfile.new('log')
      @templog.write("/home 225.183.113.22
        /contact/ 225.183.113.22
        /home 225.183.113.22
        /contact/ 225.183.113.22
        /index 122.255.244.161
        /about 138.222.28.220
        /products/3 138.222.28.220
        /about 222.28.220
        products/1 117.198.72.249
        /products/2 225.183.113.22
        /about 222.28.220
        /products/2 83.104.119.23
        /products/2 155.231.213.36
        /home 245.141.61.189")
      @templog.rewind
    end

    def test_it_instantiates_a_parser
      assert_instance_of ParserOo, @subject
    end

    def test_it_responds_to_list_pages_in_order_method
      assert_respond_to @subject, :list_pages_in_order
    end

    def test_list_pages_in_order_returns_hash
      result = @subject.list_pages_in_order
      assert_instance_of Hash, result
    end

    def test_list_pages_in_order_returns_ordered_results
      parser = ParserOo.new(@templog)
      result = parser.list_pages_in_order
      assert_equal({"/products/2"=>3, "/about"=>3, "/home"=>3, "/contact/"=>2, "products/1"=>1, "/products/3"=>1, "/index"=>1}, result)
    end

    def test_it_responds_to_list_pages_by_unique_views_method
      assert_respond_to @subject, :list_pages_in_order
    end

    def test_list_pages_by_unique_views_returns_hash
      result = @subject.list_pages_by_unique_views(i={})
      assert_instance_of Hash, result
    end

    def test_list_pages_by_unique_views_returns_ordered_results
      parser = ParserOo.new(@templog)
      result = parser.list_pages_by_unique_views
      assert_equal({"        /about 222.28.220\n"=>2, "        /contact/ 225.183.113.22\n"=>2, "        /home 245.141.61.189"=>1, "        /products/2 155.231.213.36\n"=>1, "        /products/2 83.104.119.23\n"=>1, "        /products/2 225.183.113.22\n"=>1, "        products/1 117.198.72.249\n"=>1, "        /products/3 138.222.28.220\n"=>1, "        /about 138.222.28.220\n"=>1, "        /index 122.255.244.161\n"=>1, "        /home 225.183.113.22\n"=>1, "/home 225.183.113.22\n"=>1}, result)
    end
end
