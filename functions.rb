


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
    pattern_word=/^#{prepare_word "headers",word,'^а-я№'}\w*/i 
    pattern_array.each do |array|
      w=array.grep  (pattern_word) 
      head_data<<array[0] unless w.empty?
      head_data.uniq!
    end    
  end
end

  # функция обрабатывает данные в еолонке Цвет
  # возвращает колонку с новыми значенмями, колонки надо пересобрать в ряды и добавить в таблицу
def set_colors table
p table["Цвет"]
pattern_array=get_colors  
  for word in table["Цвет"] 
    w="#{prepare_word "colors",word,'^а-яё'}" 
    pattern_array.each do |array|      
      array.each do |str|          
        m = /^(?<first>#{str})(?<second>.*)?/i.match(w)
        if $~!=nil
          p $~
          p "#{w} - w"
          p "#{array[0]} - array{0}"
          p "--------------------------------------"
          first=array[0].to_s
          if $2.length>2 || $2=="кр"          
            word.replace "#{first}-#{$2}"  
          else
            word.replace "#{first}"   
          end   
        end        
      end
    end
  end
  p table["Цвет"]
end
