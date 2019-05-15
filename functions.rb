


# функция для добавления результирующей таблицы
def add_header_data_outer  outer,data  
  # file outer date (key a to add)
  o= CSV.open(outer,"w:utf-8") 
  o << data
  o.close
  return o
end
# функция для добавления рядов в результирующгю таблицу
def add_data_outer  outer,table  
  # file outer date (key a to add)
  o= CSV.open(outer,"a:utf-8")
  table.by_row.each do|row|
    o << row
  end   
  o.close
  return o
end

#функция подготовки данных к поиску по рег выпажению
# принимает имя,слово,набор символов для затирания, возвращает обрубок
def prepare_word name,word,exeptions
  #приготовить слово
  unless word.nil?
    word=word.strip.downcase.tr(exeptions,'')
    else
      word='misstake'
      log.error("Not find! #{name}  --  #{word}!")
    end
  return word
end

# функция приводит неупорядоченные заголовки к стандартным
# принимпет входящие заголовкм head, и пустой массив head_data для упорядоченных заголоавков
# возвращает новый ряд с заголовками
def normalize_headers_names head,head_data,log
  # получить массив образцов строк для распознования и подстановки
  load "data/list_headers.rb"
  pattern_array=get_headers  
  # привести нименнования к стандартным  
  head.each do |word|
    # опознать принятые данные  
    pattern_array.each do |array|
      w=array.grep  (/^#{prepare_word "headers",word,'^а-я№'}\w*/i) 
      head_data<<array[0] unless w.empty?
      head_data.uniq!
    end    
  end

  # функция обрабатывает данные в еолонке Цвет
  def normalize_colors table
    load "data/list_colors.rb"
    pattern_array=get_colors
    pattern_array.each do |array|
    #p array[0]
    pattern="/#{array}/i"
    for word in table["Цвет"]
      #p word
    end
    end
  end

end