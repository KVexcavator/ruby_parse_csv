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
# функция для создания результирующей таблицы
def add_data_outer  data  
  # file outer date (key a to add)
  outer= CSV.open("outer_test.csv","w:utf-8") 
  outer << data
  outer.close
  return outer
end

data=['test','test2']
add_data_outer data



