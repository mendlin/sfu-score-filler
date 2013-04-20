def fill_line message	
	`xdotool type "#{message}"`		
end

count = 0

Dir['a4_score/a4/*.txt'].each do |f|
	md = /a4_score\/a4\/(\w*).txt/.match(f.to_s)
	name = md[1]
	puts name	
	File.open(f, 'r') do |inpf|		
		score = inpf.gets()

		`bash auto_fill_score.sh #{name} #{score}`		

		while (line = inpf.gets())
			fill_line line
		end
		
		`xdotool mousemove 1700 1180`
		`sleep 2`
		`xdotool click 1`
	end		
	count = count + 1		
end

puts "Fill #{count} in total."