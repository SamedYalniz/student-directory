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
	name = gets.chomp
		if name.empty?
			puts "Please enter a name!"
			name = gets.chomp
		end 
	puts "Please enter the cohort".center(50)
	month = gets.chomp.to_sym
	puts "Please enter students hobbies".center(50)
	hobbies = gets.chomp
	puts "Please enter the country of birth of the student".center(50)
	country = gets.chomp
	puts "Please enter the students' height".center(50)
	height = gets.chomp
	puts "Do you want to recheck your answer? (y for yes and everything else for no)"
	answer = gets.chomp
	if answer == "y"
		puts "Please enter the names of more students".center(50)
		puts "To finish, just hit return twice".center(50)
		name = gets.chomp
		if name.empty? 
			puts "Please enter a name!"
			name = gets.chomp
		end 
		if !name.empty? 
			puts "Please enter the cohort".center(50)
			month = gets.chomp.to_sym
			if month.empty? 
				month = "November".to_sym
			end 
			puts "Please enter students hobbies".center(50)
			hobbies = gets.chomp
			puts "Please enter the country of birth of the student".center(50)				
			country = gets.chomp
			puts "Please enter the students' height".center(50)
			height = gets.chomp
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
		name = gets.chomp
		if !name.empty? 
			puts "Please enter the cohort".center(50)
			month = gets.chomp.to_sym
			if month.empty? 
				month = "November".to_sym
			end 
			puts "Please enter students hobbies".center(50)
			hobbies = gets.chomp
			puts "Please enter the country of birth of the student".center(50)				
			country = gets.chomp
			puts "Please enter the students' height".center(50)
			height = gets.chomp
			puts "Do you want to recheck the students details? (y for yes, everything else for no)".center(50)
			answer = gets.chomp				
			if answer == "y"
				puts "Please enter the names of more students".center(50)
				puts "To finish, just hit return twice".center(50)
				name = gets.chomp
				if !name.empty? 
					puts "Please enter the cohort".center(50)
					month = gets.chomp
					if month.empty? 
						month = "November"
					end 
					puts "Please enter students hobbies".center(50)
					hobbies = gets.chomp
					puts "Please enter the country of birth of the student".center(50)				
					country = gets.chomp
					puts "Please enter the students' height".center(50)
					height = gets.chomp
				end 
			end 
		end 
		
	end  
end 

def print_specific_letter
	puts "Please enter a specific letter to print out all names starting with it".center(20)
	letter = gets.chomp
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
		process(gets.chomp)
	end 
end 
def print_menu 
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
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
	when "9"
		exit 
	else puts "What do you mean bro? Try again!"
	end 
end 
def save_students
	# open the file for writing 
	file = File.open("students.csv" , "w")
	#iterate over the arrayy of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end 
	file.close#
	puts "File saved"
end 

interactive_menu




