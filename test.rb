#coding: utf-8
require 'csv'
load 'functions.rb'

#имена входящего, результируещего и лог файлов
inner="test.csv"
outer="outer_#{inner}"
loger="loger_#{inner}"

#примитивный парсинг
File.open(inner, "r:utf-8") do |f|  
  table=CSV.parse(f, headers: true)
  #table.by_col[1]
  #table.by_row[0]
  #table[0]["№"]
  #table[0]["марка"]
  #table.empty?
  #table.size
  #table.length()
  data=table.headers.each do|w|
     p w
  end
  add_data_outer outer,data
end



