require 'extract_numbers'

def comm message
	@comments << message
end

def comm_with_score name, s
	comm(name + ": " + s )
	@score += s.to_f
end

def hint_and_comm name, s
	puts "#{s} for #{name}"
	comm_with_score name, gets()
end

def pause
	puts "press Enter to continue"
	gets()
end

# s = Extractor.new
# s.load_file("a4stdout.txt")
# s.write("a4stdout_numbers.txt")

for dir in Dir['a4/*'].select {|f| File.directory? f}				

	if File.exists? "a4_score/#{dir}.txt"
		next
	end
	
	md = /a4\/(\w*)/.match(dir)
	student_name = md[1]	

	@comments = []
	@score = 0

	puts "--------#{dir}-------"

	zip_name = Dir[dir + "/*.zip"].first()	
	c_name = Dir[dir + "/*.c"].first()
	txt_name = Dir[dir + "/*.txt"].first()

	puts `cp \"#{txt_name}\" #{student_name}_all_perms.txt`	

	File.open(c_name, "r") do |f| 
		con = f.read();
		con[/int\smain\(\)/] = "int main_0()"
		File.open("student.c", "w") do |outf|
			outf.puts("//#{student_name}");
			outf.print con
		end
	end

	puts `gcc -o a4mark cmpt130a4mark.c student.c -std=c99`
	pause
	puts `./a4mark #{student_name}`

	puts "----Grading-----"

	hint_and_comm "Q1: check_perm", 4
	hint_and_comm "Q2: perm_score", 4
	hint_and_comm "Q3: print", 4
	hint_and_comm "Q4: make_perm", 4
	hint_and_comm "Q7: score output", 4

	`subl student.c`
	hint_and_comm "Q5: brute_force", 4
	hint_and_comm "Q6: good scores", 4
	hint_and_comm "Style", 4
	hint_and_comm "Comments", 4

	File.open("a4_score/#{dir}.txt", "w") do |f|
		f.puts @score
		f.print @comments.sort().join
	end
end