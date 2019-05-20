#coding: utf-8
require 'csv'
require 'logger'
load 'functions.rb'
load "data/list_colors.rb"


#имена входящего, результируещего и лог файлов
inner="test.csv"
benefit="benefit.csv"
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
  normalize_headers_names head,head_data  
  #добавить заголовки в  таблицу прокладку
  add_header_data_outer benefit,head_data
  #добавить даные в таблицу прокладку
  add_data_outer  benefit,table
  #добавить заголовки в итоговую таблицу
  add_header_data_outer outer,head_data
end

# добавить  даные в итоговую таблицу
File.open(benefit, "r:utf-8") do |f|  
  table=CSV.parse(f, headers: true)  
  # нормализация данных "Цвет"
  set_colors table["Цвет"]
  add_data_outer  outer,table  
end
# удалить табдицу прокладку
File.delete(benefit) if File.exist?(outer)







