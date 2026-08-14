# 🐍 Python Daily Practice — Day 01

This repository contains my daily Python practice as I build stronger programming fundamentals through hands-on coding.

This notebook focuses mainly on **loops, nested data structures, pattern programming, and comprehensions**. The goal is to understand concepts by writing programs, experimenting with different approaches, and learning through debugging.

---

## 📚 Topics Covered

### 1. Nested `for` Loops

Practiced nested loops using:

* Basic nested loops
* Nested lists
* Nested tuples
* Combination of lists and tuples

Example:

```python
for i in range(3):
    for j in range(3):
        print(i, j)
```

---

### 2. Iterating Through Dictionaries

Practiced different ways of traversing dictionaries:

* Displaying dictionary keys
* Displaying dictionary values using `.values()`
* Displaying key-value pairs using `.items()`

```python
for i, j in d.items():
    print(i, j)
```

---

### 3. Type Conversion

Practiced converting a list containing key-value pairs into a dictionary.

```python
a = [['a', 1], ['b', 2]]
d = dict(a)
```

---

## ⭐ Pattern Programming

A major part of this practice session was pattern programming using loops.

Patterns practiced:

* Square of stars
* Square of numbers
* Square with alphabets
* Right-angle triangle
* Inverted right-angle triangle
* Proper triangle
* Inverted proper triangle
* Diamond pattern

Example:

```python
n = int(input("Enter number"))

for i in range(1, n + 1):
    print("*" * i)
```

Also practiced the `end` parameter of `print()` for controlling output formatting.

```python
for i in range(5):
    print("*", end=" , ")
```

---

## 🧠 Comprehensions

Practiced Python comprehensions as a way to write shorter and more expressive code.

### List Comprehension

```python
p = [x * x for x in range(1, 11)]
```

### Set Comprehension

```python
p = {x ** x for x in range(1, 11)}
```

### Dictionary Comprehension

```python
p = {x: x ** 4 for x in range(1, 11)}
```

---

## 🔎 Conditional Comprehensions

Practiced using `if` conditions inside comprehensions.

Examples include:

### Squares of Even Numbers

```python
[x ** 2 for x in range(0, 21) if x % 2 == 0]
```

### Cubes of Odd Numbers

```python
[x ** 3 for x in range(1, 21) if x % 2 != 0]
```

### Numbers Divisible by 10

```python
[i for i in range(1, 101) if i % 10 == 0]
```

---

## 📋 List Operations Using Comprehension

Also practiced using comprehensions to:

* Find elements present in one list but not another
* Find common elements between two lists
* Extract initials from names
* Split a sentence into words
* Calculate the length of every word

Example:

```python
names = ['karan', 'namit', 'aditi']

initials = [i[0] for i in names]
```

Another example:

```python
s = "maverick is best"
words = s.split()

result = [[i, len(i)] for i in words]
```

Output:

```text
[['maverick', 8], ['is', 2], ['best', 4]]
```

---

## 🛠️ Concepts Practiced

| Concept                   | Practice |
| ------------------------- | -------- |
| `for` loop                | ✅        |
| Nested loops              | ✅        |
| Lists                     | ✅        |
| Nested lists              | ✅        |
| Tuples                    | ✅        |
| Nested tuples             | ✅        |
| Dictionaries              | ✅        |
| `.values()`               | ✅        |
| `.items()`                | ✅        |
| `dict()` conversion       | ✅        |
| Pattern programming       | ✅        |
| `print(end=...)`          | ✅        |
| List comprehension        | ✅        |
| Set comprehension         | ✅        |
| Dictionary comprehension  | ✅        |
| Conditional comprehension | ✅        |
| String `split()`          | ✅        |
| `len()`                   | ✅        |
| `chr()` / `ord()`         | ✅        |

---

## 🎯 Practice Goal

The purpose of this practice is not just to memorize Python syntax, but to improve:

* Logical thinking
* Loop understanding
* Problem-solving
* Code readability
* Pattern-based reasoning
* Understanding Pythonic ways of writing code

### Daily Workflow

```text
Learn → Code → Make Mistakes → Debug → Understand → Push to GitHub
```

---

## 📈 Progress

This repository will be updated regularly as I continue my Python practice.

Each day will focus on new concepts and problems while revisiting previously learned topics.

> **Consistency over perfection. 🚀**

---

### 🧰 Tools

* Python
* Jupyter Notebook
* VS Code
* Git
* GitHub
