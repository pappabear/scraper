# use mechanize gem for parsing the HTML
# use nokogiri for using css selectors
require 'mechanize'

agent = Mechanize.new

page = agent.get('http://myday.herokuapp.com/today')

puts 'Title=' + page.title


i=0
p = page.parser
p.css('.list-group li').each do |li|
  puts 'Item text=' + li.text.strip
  i += 1
  #puts 'Item is late? = ' + li['href']
end  

for j in 0..i-1
  puts 'href=' + p.css('.list-group li a')[j]['href']
end

for j in 0..i-1
  puts 'id=' + p.css('.list-group li')[j]['id']
  puts 'data-pk=' + p.css('.list-group li')[j]['data-pk']
end


