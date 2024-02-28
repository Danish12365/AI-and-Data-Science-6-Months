# data structures
# list

# sports = ["football", "cricket", "hockey", "tennis"]
# print(sports[-4]) 

# sports[1] = "badminton"
# print(sports[1])


# # tuple

# coardinates = (10, 20, 30)
# print(coardinates[1])


# set

# Fruit_set = {"apple", "banana", "cherry"}
# print(Fruit_set)
# Fruit_set.add("orange")
# print(Fruit_set)

# dictionary

# car = {"brand": "Ford","model": "Mustang","year": 2021}
# print(car)

# print(car["brand"])
# car["year"]="2023"
# print(car)

# del car["year"]
# print(car)


# Assighnment difference between data structure in python in  a table form.


# Here's a table outlining the key differences between some common data structures in Python:

# | Data Structure | Ordered | Mutable | Allows Duplicates | Allows Mixed Data Types | Implementation |
# |----------------|---------|---------|-------------------|-------------------------|----------------|
# | List           | Yes     | Yes     | Yes               | Yes                     | Built-in       |
# | Tuple          | Yes     | No      | Yes               | Yes                     | Built-in       |
# | Dictionary     | No      | Yes     | No                | Yes (as values)         | Built-in       |
# | Set            | No      | Yes     | No                | No                      | Built-in       |
# | String         | Yes     | No      | Yes               | No                      | Built-in       |
# | Array          | Yes     | Yes     | Yes               | Yes                     | External (e.g., NumPy) |

# - **Ordered**: Indicates whether the data structure maintains the order of elements.
# - **Mutable**: Indicates whether the data structure can be modified after creation.
# - **Allows Duplicates**: Indicates whether the data structure can contain duplicate elements.
# - **Allows Mixed Data Types**: Indicates whether the data structure can contain elements of different data types.
# - **Implementation**: Specifies whether the data structure is built into the Python language or provided by an external library.

# These characteristics help determine which data structure is most appropriate for a particular task or problem.





# In Python, there are several built-in data structures that are commonly used to organize and manipulate data efficiently. 
# Some of the most commonly used data structures in Python include:

# 1. Lists: Lists are ordered, mutable (changeable), and can contain elements of different data types. 
# They are created using square brackets `[]`.

#    Example:
#    ```python
#    my_list = [1, 2, 3, 'a', 'b', 'c']
#    ```

# 2. Tuples: Tuples are ordered, immutable (unchangeable), and can contain elements of different data types. 
# They are created using parentheses `()`.

#    Example:
#    ```python
#    my_tuple = (1, 2, 3, 'a', 'b', 'c')
#    ```

# 3. Dictionaries: Dictionaries are unordered, mutable (changeable), and store key-value pairs. 
# They are created using curly braces `{}`.

#    Example:
#    ```python
#    my_dict = {'name': 'John', 'age': 30, 'city': 'New York'}
#    ```

# 4. Sets: Sets are unordered collections of unique elements. They are created using curly braces `{}` or the `set()` constructor.

#    Example:
#    ```python
#    my_set = {1, 2, 3, 4, 5}
#    ```

# 5. Strings: Strings are ordered collections of characters. They are immutable (unchangeable) and can be 
# created using single (`'`) or double (`"`) quotes.

#    Example:
#    ```python
#    my_string = 'Hello, World!'
#    ```

# 6. Arrays: Arrays are similar to lists but are optimized for numerical operations and are provided by 
# external libraries like NumPy.

#    Example (using NumPy):
#    ```python
#    import numpy as np
#    my_array = np.array([1, 2, 3, 4, 5])
#    ```

# These data structures serve different purposes and have different characteristics, making them suitable for various tasks
# and scenarios in Python programming.