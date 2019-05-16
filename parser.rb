#coding: utf-8
require 'csv'
require 'logger'
load 'functions.rb'


#имена входящего, результируещего и лог файлов
inner="test.csv"
outer="outer_#{inner}"
loger=inner.tr('.','_')+".log"

# Лог за последние 20 дней.
log=Logger.new(loger, 20, 'daily')
log.level = Logger::ERROR
log.datetime_format='%Y-%m-%d'

#примитивный парсинг
#table.headers
#table.by_col[0]  
#table[0]["№"]
#table[0]["марка"]
#table.empty?
#table.size
#table.length()

# подготовить исходящий файл
File.open(inner, "r:utf-8") do |f|  
  table=CSV.parse(f, headers: true)  
  #получить заголовки
  head=table.headers
  head_data=[]
  # нормализация заголовков
  normalize_headers_names head,head_data,log  
  #добавить заголовки в новую таблицу
  add_header_data_outer outer,head_data
  #добавить даные в новую таблицу
  add_data_outer  outer,table
end

# нормализация данных, перебор списков в папке data
File.open(outer, "a+:utf-8") do |f|
  table=CSV.parse(f, headers: true) 
  p table[2]["Цвет"]
  table[2]["Цвет"].replace "5555"
  p table[2]["Цвет"]
  #нормализация колонки Цвет
  normalize_colors table

end



