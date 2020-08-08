class FileProcess
  def self.add_line(file_path, line)
    File.open(file_path, 'a') {|f| f.write(line)}
  end

  def self.read_file(file_path)
    File.foreach(file_path) {|line| puts line}
  end

  def self.process_file(file_path, data)
    File.open(file_path, 'w') do |f|
      f.write(data)
    end
  end
end
