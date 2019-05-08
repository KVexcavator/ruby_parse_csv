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
  row=[]
  table.headers.each do|w|
    # привести нименнования к стандартным
    w=w.strip.downcase
    #настройку regex целесобрзно произволить по отдельности
    w=w.gsub(/№/,"№")
    w=w.gsub(/^мар.*/,"Марка")
    w=w.gsub(/^разм.*/,"Размер")
    w=w.gsub(/^исп.*/,"Исполнение")
    w=w.gsub(/^напр.*/,"Напряжение")
    w=w.gsub(/^тех.*/,"ТУ")
    w=w.gsub(/^гост.*/,"ГОСТ")
    w=w.gsub(/^цвет.*/,"Цвет")
    row<<w
  end
  data=row
  add_data_outer outer,data
end



