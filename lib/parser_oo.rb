require_relative 'page_lister'

class ParserOo

  def initialize(log)
    @log = log
  end

  def list_pages_in_order(h={})
    File.foreach(@log) do |line|
      h.merge(PageLister.new(line).yield_page_for_page_views(h))
    end
    result = Hash[h.sort_by{|k,v| v}.reverse]
    result.each { |k, v| puts "#{k} #{v} visits" }
  end

  def list_pages_by_unique_views(i={})
    File.foreach(@log) do |line|
      i.merge(PageLister.new(line.strip).yield_page_for_unique_views(i))
    end
    result = Hash[i.sort_by{|k,v| v}.reverse]
    result.each { |k, v| puts "#{k} #{v} unique views" }
  end

  p = ParserOo.new(ARGV[0])
  p.list_pages_in_order
  p.list_pages_by_unique_views

end
