class FileProcess
  def self.read_file(file_path)
    File.foreach(file_path) {|line| puts line}
  end

  def self.process_file(file_path, data)
    File.open(file_path, 'w') do |f|
      f.write(data)
    end
  end
end
