class Extractor
	attr_reader :number_list

	def load_string str		
		@number_list = str.scan(/\b[-+]?(\d*\.\d+|\d+)\b/)
	end

	def load_file file_name		
		File.open(file_name, "r") {|file| load_string file.read()}		
	end

	def write file_name
		File.open(file_name, "w") {|file| file.puts @number_list}
	end
end