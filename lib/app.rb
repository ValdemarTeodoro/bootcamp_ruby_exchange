require_relative 'file_process/file_process'

file_path = 'assets/investiments.txt'
data = 'Fazendo um testes'

FileProcess.process_file(file_path, data)
FileProcess.read_file(file_path)