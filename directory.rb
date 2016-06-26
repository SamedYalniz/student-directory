def print_header 
puts "The students of villains Academy"
puts "--------------"
end 

def print(students)
	students.each_with_index do |student,index|
		no = index+1 
		puts "#{no}.#{student[:name]} #{student[:cohort]} cohort"
	end 
end 

def print_footer(names)
	puts "Overall, we have #{names.count} great students"
end 

def input_students 
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	students = []
	name = gets.chomp
	while !name.empty? do 
		students << {name: name, cohort: :november}
		puts "Now we have #{students.count} students"
		name = gets.chomp
	end 
	students 
end 

students = input_students
def print_specific_letter(students)
	puts "Please enter a specific letter to print out all names starting with it"
	letter = gets.chomp
	students.each do |student|
		if student[:name].downcase.chr == letter
			puts "#{student[:name]}"
		end 
	end 
end  




print_header
print(students)
print_footer(students)
print_specific_letter(students)



