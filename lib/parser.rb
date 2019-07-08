class Parser
h={}
i={}

File.foreach("data/webserver.log") do |line|
  arr = line.split(" ")

  page_name = arr[0]
    if h.has_key?(page_name)
      h[page_name]+=1
    else
      h[page_name]=1
    end

    if i.has_key?(line)
      i[line]+=1
    else
      i[line]=1
    end

  end
puts Hash[h.sort_by{|k,v| v}.reverse]
puts Hash[i.sort_by{|k,v| v}.reverse]

end
