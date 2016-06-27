@students = [] #empty array accessible to all methods 
def print_header 
	puts "The students of villains Academy".center(50)
	puts "--------------".center(50)
end 

def print_students_list
	@students.each_with_index do |student,index|
		no = index+1 
		puts "#{no}.#{student[:name]} #{student[:cohort]} cohort"
	end 
end 

def print_footer
	if @students.count == 1 
		puts "Overall, we have #{@students.count} great student".center(50)
	else 
		puts "Overall, we have #{@students.count} great students".center(50)
	end 
end 

def input_students 
	puts "Please enter the names of the students".center(50)
	puts "To finish, just hit return twice".center(50)
	name = STDIN.gets.chomp
		if name.empty?
			puts "Please enter a name!"
			name = STDIN.gets.chomp
		end 
	puts "Please enter the cohort".center(50)
	month = STDIN.gets.chomp.to_sym
	puts "Please enter students hobbies".center(50)
	hobbies = STDIN.gets.chomp
	puts "Please enter the country of birth of the student".center(50)
	country = STDIN.gets.chomp
	puts "Please enter the students' height".center(50)
	height = STDIN.gets.chomp
	puts "Do you want to recheck your answer? (y for yes and everything else for no)"
	answer = STDIN.gets.chomp
	if answer == "y"
		puts "Please enter the names of more students".center(50)
		puts "To finish, just hit return twice".center(50)
		name = STDIN.gets.chomp
		if name.empty? 
			puts "Please enter a name!"
			name = STDIN.gets.chomp
		end 
		if !name.empty? 
			puts "Please enter the cohort".center(50)
			month = STDIN.gets.chomp.to_sym
			if month.empty? 
				month = "November".to_sym
			end 
			puts "Please enter students hobbies".center(50)
			hobbies = STDIN.gets.chomp
			puts "Please enter the country of birth of the student".center(50)				
			country = STDIN.gets.chomp
			puts "Please enter the students' height".center(50)
			height = STDIN.gets.chomp
		end 
	end
	while !name.empty? do 
		@students << {name: name, cohort: month, hobbies: hobbies, country: country, height: height}
		if @students.count == 1 
			puts "Now we have #{@students.count} student".center(50)
		else 
			puts "Now we have #{@students.count} students".center(50)
		end 
		puts "Please enter the names of more students".center(50)
		puts "To finish, just hit return twice".center(50)
		name = STDIN.gets.chomp
		if !name.empty? 
			puts "Please enter the cohort".center(50)
			month = STDIN.gets.chomp.to_sym
			if month.empty? 
				month = "November".to_sym
			end 
			puts "Please enter students hobbies".center(50)
			hobbies = STDIN.gets.chomp
			puts "Please enter the country of birth of the student".center(50)				
			country = STDIN.gets.chomp
			puts "Please enter the students' height".center(50)
			height = STDIN.gets.chomp
			puts "Do you want to recheck the students details? (y for yes, everything else for no)".center(50)
			answer = STDIN.gets.chomp				
			if answer == "y"
				puts "Please enter the names of more students".center(50)
				puts "To finish, just hit return twice".center(50)
				name = STDIN.gets.chomp
				if !name.empty? 
					puts "Please enter the cohort".center(50)
					month = STDIN.gets.chomp
					if month.empty? 
						month = "November"
					end 
					puts "Please enter students hobbies".center(50)
					hobbies = STDIN.gets.chomp
					puts "Please enter the country of birth of the student".center(50)				
					country = STDIN.gets.chomp
					puts "Please enter the students' height".center(50)
					height = STDIN.gets.chomp
				end 
			end 
		end 
		
	end  
end 

def print_specific_letter
	puts "Please enter a specific letter to print out all names starting with it".center(20)
	letter = STDIN.gets.chomp
	@students.each do |student|
		if @student[:name].downcase.chr == letter
			puts "#{@student[:name]}".center(50)
		end 
	end 
	puts ""
end  

def print_short
	puts "Printing students with names shorter than 12 chars".center(50)
	@students.each do |student|
		if @student[:name].length < 12
			puts "#{@student[:name]}".center(50)

		end 
	end 
end 

def print_with_loop 
	counter = 0
	while counter != @students.length
		 puts "#{(@students[counter])[:name]} #{(@students[counter])[:cohort]} cohort #{(@students[counter])[:hobbies]} #{(@students[counter])[:country]} #{(@students[counter])[:height]}".center(50)
		 counter +=1 
	end 
end 

def print_sorted_by_cohort
	puts "Which cohort do you want to see?"
	month = STDIN.gets.chomp.capitalize.to_sym
	selection = []
	selection << @students.map{|student| student[:name] if student[:cohort] == month}
	puts "Cohort: #{month}"
	puts "Students: #{selection.flatten.join("; ")}"
end 

def print_sorted_by_cohorts
	@students.sort_by {|student| student[:cohort]}
	@students.each_with_index do |student,index|
		no = index+1 
		puts "#{no}.#{@student[:name]} #{@student[:cohort]} cohort"
	end 
end 

def interactive_menu
	loop do 
		print_menu
		process(STDIN.gets.chomp)
	end 
end 
def print_menu 
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit" 
end 
def show_students 
	print_header
	print_students_list
	print_footer 
end 
def process (selection)
	case selection
	when "1"
		input_students
	when "2"
		show_students
	when "3"
		save_students
	when "4"
		load_students
	when "9"
		exit 
	else puts "What do you mean bro? Try again!"
	end 
end 
def save_students
	puts "To which file do you want to save the students?"
	filename = STDIN.gets.chomp
	if File.exists?(filename)
		# open the file for writing 
		file = File.open(filename , "w")
		#iterate over the arrayy of students
		@students.each do |student|
			student_data = [student[:name], student[:cohort]]
			csv_line = student_data.join(",")
			file.puts csv_line
		end 
	else 
		puts "File does not exist try another"
		save_students
	end 
	file.close#
	puts "File saved!".center(50)
end 
def load_students (filename = "students.csv")
	puts "Which file do you want to load?"
	filename = STDIN.gets.chomp
	if File.exists?(filename)
		file = File.open(filename,"r")
		file.readlines.each do |line|
			name, cohort = line.chomp.split(',')
			@students << {name: name, cohort: cohort.to_sym}
		end 
	else 
		puts "Filename does not exist"
		puts "Please try again"
		load_students
	end 
	file.close
	puts "File loaded!".center(50)
end 
def try_load_students
	filename = ARGV.first
	return if filename.nil?
	if File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.count} from #{filename}"
	else 
		load_students(student.csv)
		puts "Loaded #{@students.count} from #{filename}"
	end 
end 

def add_students_to_array(name, cohort)
	@students << {name: name, cohort: cohort.to_sym}
end 


try_load_students
interactive_menu




