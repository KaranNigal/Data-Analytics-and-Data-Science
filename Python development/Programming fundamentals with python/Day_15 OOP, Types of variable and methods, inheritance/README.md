# Day 14 – Python OOP Practice 🐍

This repository contains my **Day 14 Python practice**, focused on **Object-Oriented Programming (OOP)** concepts.

## 📚 Topics Practiced

### 1. Static / Class Variables

* Variables declared inside a class and shared among objects.
* Accessed using the class name or object reference.
* Creating class variables inside:

  * Constructor
  * Instance method
  * Class method
  * Static method
  * Outside the class

### 2. Local Variables

* Variables declared inside a method.
* Available only within that method.
* Created when the method is called and removed after execution.

### 3. Types of Methods

#### Instance Method

* Uses instance variables.
* Requires `self` as the first parameter.
* Accesses object-specific data using `self`.

#### Class Method

* Uses class/static variables.
* Uses the `@classmethod` decorator.
* Requires `cls` as the first parameter.

#### Static Method

* General utility method.
* Does not require `self` or `cls`.
* Can be called using either the class name or object.

### 4. Getter and Setter Methods

Practiced methods for setting and retrieving object values.

Example concepts:

* `SetName()` / `GetName()`
* Setting and getting multiple attributes.

### 5. Returning Multiple Values

Practiced returning multiple values from a function.

```python
def op(a, b):
    return a + b, a * b
```

Multiple returned values are received as a **tuple**.

### 6. Inheritance

Practiced how a child class can inherit properties and methods from a parent class.

#### Single Inheritance

```text
Parent
   ↓
 Child
```

#### Multilevel Inheritance

```text
A
↓
B
↓
C
```

A child class can access inherited methods from its parent classes.

## 🧪 Practice Covered

* Creating classes and objects
* Working with class/static variables
* Working with instance variables
* Understanding local variables
* Instance methods
* Class methods
* Static methods
* Getter and setter methods
* Returning multiple values
* Single inheritance
* Multilevel inheritance

## 📁 Notebook

The practice examples are available in the Jupyter Notebook included in this day's folder.

## 🎯 Goal

The goal of today's practice was to strengthen my understanding of **Python OOP fundamentals** and become comfortable with classes, objects, methods, variables, and inheritance.

---

**Day 14 of Python Practice 🚀**
