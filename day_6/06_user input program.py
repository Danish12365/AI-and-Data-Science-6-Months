# person_A_name = input("Enter your name: ")
# person_A_age = input("Enter your age: ")

# person_B_name = input("Enter your name: ")
# person_B_age = input("Enter your age: ")

# if person_A_age > person_B_age:
#     print(person_A_name, "is Greater then", person_B_name)
# else:
#     print(person_A_name ,"is younger then", person_B_name)

# Name_A = input("Enter your name: ")
# AGE_A  = int(input("Enter your age: "))

# Name_B = input("Enter your name: ")
# AGE_B  = int(input ("How old are you: "))

# if AGE_A > AGE_B:
#     print(Name_A, "is Greater then", Name_B)
# else:
#     print(Name_A ,"is younger then", Name_B)

#(Assighnment) ASK HIM Name,WAIGHT AND HEIGHT AND make the BMI (Body Mass Index) index calculator
    

Name = input("Enter your name: ")
Weight = int(input("What is Waight: "))
Height = int(input("Enter your Height: "))


BMI = (Weight * 703) / (Height * Height)
print(BMI)

if BMI > 0:
    if BMI > 18.5:
        print(Name, "You are under Weight")
    elif BMI >= 24.9:
        print(Name, "You are Normal Weight")
    elif BMI < 29.9:(Name, "You are Over Weight")
    else:
        print(Name, "You are Obese")
else:
    print("Enter Valid Weight and Height")















