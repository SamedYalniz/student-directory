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
def getting_name	
	puts "Please enter the name of the student"
	name = gets.chomp
	name
end
def getting_month
	puts "Please enter the cohort"
	month = gets.chomp
	month
end 
def getting_hobbies
	puts "Please enter students' hobbies"
	hobbies = gets.chomp
	hobbies
end 
def getting_country
	puts "Please enter students' birth country"
	country = gets.chomp
	country
end
def getting_height
	puts "Please enter students height"
	height = gets.chomp
	height
end 
def getting_details
	getting_name
	getting_month
	getting_hobbies
	getting_country
	getting_height
end 























def input_students 
	puts "Please enter the names of the students".center(50)
	puts "To finish, just hit return twice".center(50)
	students = []
	name = gets.chomp
	puts "Please enter the cohort".center(50)
	month = gets.chomp
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




print_header
print_with_loop(students)
print_footer(students)
print_specific_letter(students)
print_short(students)



