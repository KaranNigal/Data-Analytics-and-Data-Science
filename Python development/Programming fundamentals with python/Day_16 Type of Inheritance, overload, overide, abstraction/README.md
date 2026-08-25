# 🐍 Python OOP — Daily Practice

This repository contains my daily Python practice, with a focus on **Object-Oriented Programming (OOP)** concepts and implementation.

## 📅 Practice Day

**Topic:** Python OOP — Inheritance, Polymorphism & Abstraction

---

## 📚 Topics Covered

### 1. Inheritance

Practiced the major types of inheritance in Python:

* **Single Inheritance**
* **Multilevel Inheritance**
* **Hierarchical Inheritance**
* **Multiple Inheritance**
* **Hybrid Inheritance**

Also practiced inheritance through class diagrams and accessing methods from parent and grandparent classes.

### 2. Method Resolution Order (MRO)

Practiced the `mro()` function to understand the order in which Python searches for methods and parent classes.

```python
E.mro()
```

---

### 3. Polymorphism

Explored how the same operator or method can behave differently depending on the object or input.

Examples:

```python
print(1 + 1)
print("a" + "a")

print(2 * 2)
print(2 * "a")
```

---

### 4. Operator Overloading

Practiced special/magic methods to change the behavior of operators for custom classes.

Examples covered:

* `__add__()` → `+`
* `__mul__()` → `*`

Example:

```python
def __add__(self, other):
    return self.pages + other.pages
```

This allows objects of a class to work with operators such as `+`.

---

### 5. Method & Constructor Overloading

Experimented with method and constructor overloading.

Key observation:

> Python does not support traditional method or constructor overloading where multiple definitions with different parameters coexist.

When the same method or constructor is defined multiple times, the **latest definition replaces the previous one**.

---

### 6. Method Overriding

Practiced overriding a parent class method in a child class.

```python
class Child(Parent):
    def marriage(self):
        print("Child implementation")
```

The child class can provide its own implementation of a method inherited from the parent.

---

### 7. `super()` Keyword

Practiced using `super()` to access parent-class functionality from a child class.

Used for:

* Calling a parent method
* Calling a parent constructor

Example:

```python
super().marriage()
```

and

```python
super().__init__(name, age)
```

---

### 8. Abstraction

Practiced abstract classes using Python's `abc` module.

Key concepts:

* `ABC`
* `@abstractmethod`
* Abstract classes
* Abstract methods
* Implementing abstract methods in child classes

Example:

```python
from abc import ABC, abstractmethod

class Test(ABC):

    @abstractmethod
    def m1(self):
        pass
```

An abstract class acts as a **blueprint for its child classes** and cannot normally be instantiated when it contains unimplemented abstract methods.

---

## 🧠 Key Learnings

Today's practice helped me understand:

* How different inheritance structures work
* How Python determines the method lookup order
* How polymorphism works in Python
* How magic methods enable operator overloading
* Why traditional method/constructor overloading doesn't work in Python
* Difference between **overloading** and **overriding**
* How `super()` connects child and parent implementations
* How abstraction is implemented using `ABC` and `@abstractmethod`

---

## 🛠️ Technologies

* Python 3
* Object-Oriented Programming
* Python `abc` module

---

## 📁 Practice Structure

```text
Python-OOP/
│
├── inheritance
├── polymorphism
├── operator-overloading
├── method-overriding
├── super-keyword
└── abstraction
```

The notebook contains hands-on examples for each concept covered during today's practice.

---

## 🚀 Next Step

Continue daily Python practice by building on these OOP concepts and gradually solving more practical problems using classes, objects, inheritance, polymorphism and abstraction.

> **Consistency > Complexity.**
>
> One concept practiced every day.
