


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

# функция приводит неупорядоченные заголовки к стандартным
# принимпет входящие заголовкм head, и пустой массив head_data для упорядоченных заголоавков
# возвращает новый ряд с заголовками
def normalize_headers_names head,head_data
  # получить массив образцов строк для распознования и подстановки
  load "data/list_headers.rb"
  pattern_array=get_headers  
  # привести нименнования к стандартным
  head.each do |word|
    #придготовить слово
    p word
    p stub=word.strip.downcase.tr('^а-я','')
    #еайти соответствие
    pattern_array.each do |array|
      w=array.grep /^#{stub}.*/i
      p w
      head_data<<w[0] unless w.empty?
      head_data.uniq!
    end
  end


  # pattern_array.each do |subarray|
  #   subarray.each do |pattern|
  #     head.each do|s|
  #       inner_string=s.strip.downcase
  #       if pattern =~ /^#{inner_string}.*/i         
  #         outer_string=inner_string.gsub(/^#{inner_string}.*/i, subarray[0])
  #         head_data<<outer_string
  #       end      
  #     end
  #   end
  # end

  #head_data.uniq!
end