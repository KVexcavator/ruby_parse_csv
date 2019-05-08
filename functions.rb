
# функция для добавления результирующей таблицы
def add_header_data_outer  outer,data  
  # file outer date (key a to add)
  o= CSV.open(outer,"w:utf-8") 
  o << data
  o.close
  return o
end
# функция для добавления рядов в результирующгю таблицу
def add_data_outer  outer,data  
  # file outer date (key a to add)
  o= CSV.open(outer,"a:utf-8") 
  o << data
  o.close
  return o
end

# функция приводит неупорядоченные заголовки к стандартным
# возвращает новый ряд с заголовками
def normalize_headers_names head,head_data
  head.each do|w|
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
    head_data<<w
  end
end