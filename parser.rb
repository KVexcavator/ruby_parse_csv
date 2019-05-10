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
  #table.by_col[0]  
  #table[0]["№"]
  #table[0]["марка"]
  #table.empty?
  #table.size
  #table.length()
  #получить заголовки
  head=table.headers
  head_data=[]
  # нормализация заголовков
  normalize_headers_names head,head_data  
  #добавить заголовки в новую таблицу
  add_header_data_outer outer,head_data
  # нормализация данных, перебор списков в папке data

  #добавить даные в новую таблицу
  add_data_outer  outer,table
end



