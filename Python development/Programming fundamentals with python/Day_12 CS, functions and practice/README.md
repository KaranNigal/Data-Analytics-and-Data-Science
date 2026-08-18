# 🐍 Python Daily Practice

This repository contains my **daily Python practice** as I build a strong foundation in Python programming.

The goal is to practice consistently, document what I learn, and maintain a regular **GitHub contribution habit**.

---

## 📚 Topics Covered

### 1. List, Set & Dictionary Comprehensions

* Conditional expressions inside comprehensions
* Set comprehensions
* Filtering elements using conditions
* Dictionary comprehensions
* Reversing strings using dictionary comprehension

### 2. Tuples & Generators

* Tuple creation
* Why tuple comprehensions are not directly supported
* Generator expressions
* Type casting a generator into a tuple

### 3. Python Functions

* Function definition and calling
* Parameters and arguments
* Function reusability
* Documentation strings
* User-defined functions
* `return` statements

### 4. Built-in Functions

Practiced functions including:

```python
help()
round()
sum()
min()
max()
abs()
zip()
eval()
```

### 5. `print()` vs `return`

Understanding the difference between:

* Displaying a result using `print()`
* Returning a value using `return`
* Using the returned value as input to another function

### 6. Basic Function Problems

Implemented functions for:

* Even/Odd checking
* Addition
* Multiplication
* Square of a number
* Generating even numbers
* Generating odd numbers
* Factorial
* Palindrome checking
* Sum of elements in a list

---

## 💡 Important Concepts Learned

### Function Reusability

Instead of writing the same logic repeatedly:

```python
def even_odd(n):
    if n % 2 == 0:
        print("even")
    else:
        print("odd")
```

The function can be called whenever required:

```python
even_odd(101)
even_odd(202)
```

### `return` vs `print`

A major concept practiced in this session:

```python
def add(a, b):
    return a + b

result = add(5, 6)

def square(x):
    return x * x

square(result)
```

The value returned by one function can be stored and passed to another function.

---

## 🛠️ Tools Used

* Python
* Jupyter Notebook
* Git
* GitHub

---

## 📂 Repository Structure

```text
Python-Daily-Practice/
│
├── Day-01/
│   └── practice.ipynb
│
├── Day-02/
│   └── practice.ipynb
│
├── Day-03/
│   └── practice.ipynb
│
└── README.md
```

The repository will be updated regularly as I continue practicing Python.

---

## 🎯 Goal

The objective of this repository is not just to complete exercises, but to:

* Practice Python consistently
* Strengthen programming fundamentals
* Improve problem-solving skills
* Track my learning progress
* Build a consistent GitHub contribution habit

---

## 📈 Progress

| Topic                   | Status |
| ----------------------- | ------ |
| Comprehensions          | ✅      |
| Sets                    | ✅      |
| Dictionaries            | ✅      |
| Tuples & Generators     | ✅      |
| Functions               | ✅      |
| Built-in Functions      | ✅      |
| `print()` vs `return`   | ✅      |
| Basic Function Problems | ✅      |

---

> **Consistency over intensity. One practice session, one commit, every day.** 🚀
