#coding: utf-8
require 'csv'

#входящий файл
inner="test.csv"
#примитивный парсинг
File.open(inner, "r:utf-8") do |f|
  p table=CSV.parse(f, headers: true)
  p table.by_col[1]
  p table.by_row[0]
  p table[0]["№"]
  p table[0]["марка"]
  p table.empty?
  p table.size
  p table.length()
  table.headers.each{|w| p w}
end



#table_end= CSV.open("test_end.csv","w:utf-8") # key a to add
#table_end.close
#file.truncate(f,0) #to wipe all contain file
