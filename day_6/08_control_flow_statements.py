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
fruits = ["apple", "banana", "orange"]
for fruit in fruits:
    print(fruit)

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

# # Example 5: Nested loops
# for i in range(3):
#     for j in range(3):
#         print(i, j)



















