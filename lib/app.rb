require_relative 'file_process/file_process'

file_path = 'assets/investiments.txt'
data = "Fazendo um testes\n"
line = "Uma nova linha no arquivo\n"

FileProcess.process_file(file_path, data)
FileProcess.read_file(file_path)
FileProcess.add_line(file_path, line)