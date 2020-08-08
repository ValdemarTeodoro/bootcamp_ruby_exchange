class ExchangeFile
  
  def read_and_process_file(file_name)
    new_content = ""

    # Ler o arquivo
    File.open(file_name) do |f|
      # Para cada linha desse arquivo...
      f.each_with_index do |line, index|

        # Remove os espaços...
        line = line.strip

        # Auto incremento...
        # Pega a linha se for o cabeçalho (index == 0)
        new_content += "#{line}, exchanged\n" if index == 0
        
        # Se for maior que 0 é o corpo, ou seja, restante do conteudo...
        if index > 0
          value = get_value(line)

          # Formata o valor...
          new_content += "#{line}, #{sprintf( "%0.02f",  exchange(value))}\n"
        end
      end
    end
    new_content
  end

  def process_info(file, data)
    FileProcess.process_file(file, data)
  end

  def get_value(line)
    # Quebra em array
    array = line.split(',')
    puts "-" * 100
    puts array
    
    # pagando o valor e removendo espsaços e quebra de linha
    value = array.last.strip
    value
  end

  def exchange(value)
    Exchange.new('USD', 'BRL', value).perform
  end
end