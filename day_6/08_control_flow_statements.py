# conditional statements
# if statement

# if
# if-else
# if-elif-else

# x = -5 

# if x > 0:
#     print("x is positive")
# elif x < 0:
#     print("x is negative")
# else:
#     print("x is zero")


    # for loop

# sports = ["football", "cricket", "hockey", "tennis"]
# for x in sports:
#     print(x)

    # while loop

# i = 1
# while i < 6:
#     print(i)
#     i = i+1

    # controll statement

# for x in ("python"):
#     if x == "h":
#      break
#     print(x)


# for x in ("python"):
#     if x == "h":
#      continue
#     print(x)

# for x in ("python"):
#     if x == "h":
#      pass
#     print(x)



    # Assighnment: 5 examples on each control flow statement

# Here are five examples for each control flow statement using different condition operators in Python:

# 1. if
# 2. if-else
# 3. if-elif-else
# 4. for loop
# 5. while loop

# Example 1: Greater than operator
# x = 10
# if x > 0:
#     print("Positive")
# elif x < 0:
#     print("Negative")
# else:
#     print("Zero")

# Example 2: Less than or equal to operator
# temperature = 30
# if temperature <= 0:
#     print("Freezing")
# elif temperature > 0 and temperature <= 15:
#     print("Cold")
# elif temperature > 15 and temperature <= 25:
#     print("Mild")
# else:
#     print("Hot")

# # Example 3: Not equal to operator
# grade = "F"
# if grade != "F":
#     print("Pass")
# else:
#     print("Fail")

# # Example 4: In operator (checking membership)
# fruits = ["apple", "banana", "orange"]
# if "apple" in fruits:
#     print("Apple is in the list")
# else:
#     print("Apple is not in the list")

# # Example 5: Is operator (checking identity)
# x = [1, 2, 3]
# y = [1, 2, 3]
# if x is y:
#     print("x and y refer to the same object")
# else:
#     print("x and y refer to different objects")

# When we use the is operator to compare x and y, it checks their memory addresses. Since x and y 
# are separate objects, their memory addresses are different.
# Therefore, the condition x is y evaluates to False, and the code inside the else block is executed.
# As a result, the output will be: "x and y refer to different objects


# To compare the contents of lists instead of their memory addresses, you should use the == operator:
# x = [1, 2, 3]
# y = [1, 2, 3]
# if x == y:
#     print("x and y refer to the same object")
# else:
#     print("x and y refer to different objects")
# This will compare the elements of x and y, and since they have the same contents, the output will 
# be: "x and y have the same contents".



# loops

# Example 1: For loop with range
# for i in range(5):
#     print(i)

# # Example 2: For loop iterating over a list
# fruits = ["apple", "banana", "orange"]
# for fruit in fruits:
#     print(fruit)

# # Example 3: While loop with greater than operator
# count = 0
# while count < 5:
#     print(count)
#     count += 1

# # Example 4: While loop with not equal to operator
# num = 10
# while num != 0:
#     print(num)
#     num -= 2
# Decrement num by 2 (num -= 2), which means subtract 2 from the current value of num.

# # Example 5: Nested loops
# for i in range(3):
#     for j in range(3):
#         print(i, j)
        
# The outer loop for i in range(3): iterates over the numbers 0, 1, and 2.
# For each iteration of the outer loop, the inner loop for j in range(3): iterates over the
# numbers 0, 1, and 2.
# Inside the inner loop, the print(i, j) statement prints the current values of i and j.



# Break and Continue:

# Example 1: Break statement in for loop
# for i in range(10):
#     if i == 5:
#         break
#     print(i)

# # Example 2: Continue statement in for loop
# for i in range(10):
#     if i % 2 == 0:
#         continue
#     print(i)

# Inside the loop, there's an if statement that checks if the current value of i is even (i.e., divisible by 2) using 
# the modulus operator %.
# If i is even (i % 2 == 0), the continue statement is executed, which skips the rest of the code block for the current 
# iteration and moves on to the next iteration of the loop.
# If i is odd, the print(i) statement is executed, which prints the value of i.
# Let's trace through the loop:

# # Example 3: Break statement in while loop
# num = 10
# while num > 0:
#     print(num)
#     num -= 1
#     if num == 5:
#         break
# num is decremented by 1 (num -= 1), effectively counting down from 10 to 1.


# # Example 4: Continue statement in while loop
# num = 10
# while num > 0:
#     num -= 1
#     if num % 2 == 0:
#         continue
#     print(num)


# # Example 5: Using break and continue together
# for i in range(10):
#     if i == 5:
#         break
#     elif i % 2 == 0:
#         continue
#     print(i)



# Pass Statement:

# Example 1: Using pass in if statement
# x = 10
# if x < 0:
#     pass  # Placeholder for future implementation
# else:
#     print("Positive")

# # Example 2: Using pass in while loop
# num = 5
# while num > 0:
#     pass  # Placeholder for future implementation
#     num -= 1

# # Example 3: Using pass in for loop
# for i in range(5):
#     pass  # Placeholder for future implementation

# # Example 4: Using pass in a function definition
# def my_function():
#     pass  # Placeholder for future implementation

# # Example 5: Using pass in a class definition
# class MyClass:
#     def __init__(self):
#         pass  # Placeholder for future implementation


































