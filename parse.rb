#!/usr/bin/env ruby
DAY_LEN = 200

words = []
(1..12).each do |i|
  puts "reading #{i}/#{12}"
  file = File.read("levels.level#{i}.csv")
  puts "---- rows: #{file.count("\n")}"
  file.each_line do |line|
    line.strip!
    row = line.split ";"
    a = row[1]
    b = row[2]
    words.push ({:a => a, :b => b})
    # p "#{a}; #{b}"
  end
end

len = words.size / DAY_LEN
(0...len).each do |i|
  puts "writing #{i+1}/#{len}"

  ws = words[i*DAY_LEN, (i+1)*DAY_LEN]
  s = ws.map {|h|
    h[:a].gsub(',','、') + ',' + h[:b].gsub(',','、')
  }.join("\n")

  File.write("days/day#{i+1}.csv", s)
end
