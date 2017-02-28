## functions help save you time and code by saving a repetitive action into a reusable chunk of code






#### BASICS ####

my_function <- function(argument1, argument2){
  # do something 
}











## check if a number is even
is_even <- function(number){
  remainder = number %% 2
  if(remainder == 0){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

is_even(5)
is_even(4)






## pass two arguments, compare them, print a custom result
compare_numbers <- function(number1, number2){
  if(number1 > number2){
    response = "Number 1 is larger than Number 2."
    return(response)
  }
}



compare_numbers(50, 40)





