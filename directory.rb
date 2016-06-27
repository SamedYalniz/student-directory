def print_header 
puts "The students of villains Academy".center(50)
puts "--------------".center(50)
end 

def print(students)
	students.each_with_index do |student,index|
		no = index+1 
		puts "#{no}.#{student[:name]} #{student[:cohort]} cohort"
	end 
end 

def print_footer(names)
	if names.count == 1 
		puts "Overall, we have #{names.count} great student".center(50)
	else 
		puts "Overall, we have #{names.count} great students".center(50)
	end 
end 

def input_students 
	puts "Please enter the names of the students".center(50)
	puts "To finish, just hit return twice".center(50)
	students = []
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

		students << {name: name, cohort: month, hobbies: hobbies, country: country, height: height}
		if students.count == 1 
			puts "Now we have #{students.count} student".center(50)
		else 
			puts "Now we have #{students.count} students".center(50)
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
	students 
end 

students = input_students
def print_specific_letter(students)
	puts "Please enter a specific letter to print out all names starting with it".center(20)
	letter = gets.chomp
	students.each do |student|
		if student[:name].downcase.chr == letter
			puts "#{student[:name]}".center(50)
		end 
	end 
	puts ""
end  

def print_short(students)
	puts "Printing students with names shorter than 12 chars".center(50)
	students.each do |student|
		if student[:name].length < 12
			puts "#{student[:name]}".center(50)

		end 
	end 
end 

def print_with_loop (students)
	counter = 0
	while counter != students.length
		 puts "#{(students[counter])[:name]} #{(students[counter])[:cohort]} cohort #{(students[counter])[:hobbies]} #{(students[counter])[:country]} #{(students[counter])[:height]}".center(50)
		 counter +=1 
	end 
end 

def print_sorted_by_cohort(students)
	puts "Which cohort do you want to see?"
	month = STDIN.gets.chomp.capitalize.to_sym
	selection = []
	selection << students.map{|student| student[:name] if student[:cohort] == month}
	puts "Cohort: #{month}"
	puts "Students: #{selection.flatten.join("; ")}"
end 

def print_sorted_by_cohorts(students)
	students.sort_by {|student| student[:cohort]}
	students.each_with_index do |student,index|
		no = index+1 
		puts "#{no}.#{student[:name]} #{student[:cohort]} cohort"
	end 
end 

def interactive_menu
	students = []
	loop do 
		#1. print the menu and ask the user what to do
		puts "1. Input the students"
		puts "2. Show the students"
		puts "9. Exit" # 9 because we'll be adding more items

		#2. read the input and save it into a variable
		selection = gets.chomp

		#3.do what the user has asked
		case selection 
		when "1"
			students = input_students
		when "2"
			print_header
			print(students)
			print_footer(students) 
		when "9"
			exit #this will cause the program to terminate 
		else 
			puts " What do you mean bro? Try again!"
		end 
	end 
end 




interactive_menu




