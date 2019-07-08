class PageLister

  def initialize(line)
    @line = line
  end

  def yield_page_for_page_views(h)
    arr = @line.split(" ")
    page_name = arr[0]
      if h.has_key?(page_name)
        h[page_name]+=1
      else
        h[page_name]=1
      end
    h
  end

  def yield_page_for_unique_views(i)
    if i.has_key?(@line)
      i[@line]+=1
    else
      i[@line]=1
    end
    i
  end

end
