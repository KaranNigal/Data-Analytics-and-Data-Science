# Day 21 - NumPy Fundamentals 🐍📊

This repository contains my **Day 21 Python learning practice**, focused on learning the fundamentals of **NumPy (Numerical Python)**.

In this notebook, I practiced creating NumPy arrays, working with different dimensions, array slicing, reshaping, data types, broadcasting, vectorization, and statistical operations.

---

## 📚 Topics Covered

- Introduction to NumPy
- Installing and Importing NumPy
- NumPy Arrays
- Python Lists vs NumPy Arrays
- 1D Arrays
- 2D Arrays
- 3D Arrays
- Array Dimensions using `ndim`
- Array Slicing
- Creating Arrays from Tuples
- Specifying Array Data Types
- Array Size and Shape
- Reshaping Arrays
- Creating Sequential Arrays using `arange()`
- Transpose of an Array
- Flattening Arrays
- Creating Arrays using `ones()`
- Creating Arrays using `zeros()`
- Creating Evenly Spaced Values using `linspace()`
- Broadcasting
- Vectorization
- Array Arithmetic Operations
- Statistical Functions

---

# 🔢 What is NumPy?

**NumPy** stands for **Numerical Python**.

It is a Python library used for:

- Numerical Computing
- Scientific Computing
- Data Analysis
- Machine Learning
- Deep Learning
- Matrix Operations
- Linear Algebra
- Statistical Calculations

NumPy is known for being **fast and memory-efficient** compared to traditional Python lists.

---

# ⚙️ Installation

NumPy can be installed using `pip`:

```bash
pip install numpy
```

---

# 📦 Importing NumPy

NumPy is commonly imported using the alias `np`.

```python
import numpy as np
```

---

# 📋 Python List vs NumPy Array

| Python List | NumPy Array |
|---|---|
| Can contain mixed data types | Usually stores elements of the same data type |
| Slower for numerical operations | Faster for numerical operations |
| Uses more memory | More memory-efficient |
| Often requires loops for element-wise operations | Supports vectorized operations |
| Can use nested lists | Supports multi-dimensional arrays |

---

# 📏 Creating a NumPy Array

A NumPy array can be created from a Python list.

```python
import numpy as np

a = np.array([1, 2, 3, 4])

print(a)
```

To check the type:

```python
print(type(a))
```

---

# 1️⃣ One-Dimensional Array

A one-dimensional array contains elements in a single dimension.

```python
a = np.array([1, 2, 3, 4])

print(a.ndim)
```

Output:

```text
1
```

---

# 2️⃣ Two-Dimensional Array

A two-dimensional array is arranged in rows and columns.

```python
a = np.array([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
])

print(a)
print(a.ndim)
```

Output:

```text
2
```

---

# 3️⃣ Three-Dimensional Array

A three-dimensional array contains multiple 2D arrays.

```python
a = np.array([
    [
        [1, 2, 3],
        [4, 5, 6]
    ],
    [
        [7, 8, 9],
        [3, 5, 8]
    ]
])

print(a.ndim)
```

Output:

```text
3
```

### Common Uses of 3D Arrays

- Image Processing
- Deep Learning
- Medical Imaging
- Video Processing

---

# 📐 Checking Array Dimensions

The `ndim` attribute is used to check the number of dimensions.

```python
print(a.ndim)
```

Examples:

```text
1D Array → 1
2D Array → 2
3D Array → 3
```

---

# ✂️ Array Slicing

NumPy arrays can be sliced similarly to Python lists.

For a 2D array:

```python
array[row_slice, column_slice]
```

Example:

```python
b = np.array([
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [6, 7, 8, 9]
])

print(b[0:2, 0:2])
```

---

# 🔄 Reversing Arrays

Rows can be reversed:

```python
b[::-1, :]
```

Columns can be reversed:

```python
b[:, ::-1]
```

Both rows and columns can be reversed:

```python
b[::-1, ::-1]
```

---

# 🧩 Creating Arrays from Tuples

NumPy arrays can also be created from tuples.

```python
a = np.array(
    (
        (1, 2, 3, 4),
        (3, 4, 5, 6),
        (8, 9, 7, 6)
    )
)
```

---

# 🏷️ Specifying Array Data Types

The data type of an array can be specified using `dtype`.

### Float Array

```python
a = np.array([1, 2, 3], dtype=float)

print(a)
```

### Boolean Array

```python
a = np.array([1, 0, 3], dtype=bool)

print(a)
```

---

# 🔢 Array Size

The `size` attribute gives the total number of elements in an array.

```python
a = np.array([1, 2, 3, 4, 5])

print(a.size)
```

---

# 📐 Array Shape

The `shape` attribute gives the structure of an array.

For a 2D array:

```python
a = np.array([
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [4, 6, 8, 9]
])

print(a.shape)
```

Output:

```text
(3, 4)
```

This means:

```text
3 Rows
4 Columns
```

---

# 🔄 Reshaping Arrays

The `reshape()` function changes the structure of an array.

The total number of elements must remain the same.

```python
a.reshape(4, 3)
```

Other examples:

```python
a.reshape(1, 12)
```

```python
a.reshape(12, 1)
```

```python
a.reshape(6, 2)
```

```python
a.reshape(2, 6)
```

---

# 🔢 Creating Sequential Arrays using `arange()`

The `arange()` function creates sequential arrays.

```python
a = np.arange(1, 11)

print(a)
```

Output:

```text
[ 1  2  3  4  5  6  7  8  9 10]
```

It can also use a step value.

```python
a = np.arange(6, 20, 2)

print(a)
```

---

# 🔁 Transpose of an Array

The transpose converts rows into columns and columns into rows.

```python
a = np.array([
    [2, 5, 7, 8],
    [5, 8, 9, 6],
    [2, 8, 9, 4]
])

print(np.transpose(a))
```

---

# 📄 Flattening an Array

The `flatten()` function converts a multi-dimensional array into a one-dimensional array.

```python
a = np.array([
    [2, 5, 7],
    [5, 8, 9]
])

print(a.flatten())
```

---

# 🔳 Creating an Array of Ones

The `ones()` function creates an array filled with ones.

```python
a = np.ones([4, 3], dtype=np.int16)

print(a)
```

---

# ⬛ Creating an Array of Zeros

The `zeros()` function creates an array filled with zeros.

```python
a = np.zeros([4, 4], dtype=np.int8)

print(a)
```

---

# 💾 Item Size

The `itemsize` attribute gives the size of each element in bytes.

```python
print(a.itemsize)
```

---

# 📊 Creating Evenly Spaced Values using `linspace()`

The `linspace()` function generates evenly spaced values between a starting and ending value.

```python
a = np.linspace(10, 20, 5)

print(a)
```

---

# 🚀 Broadcasting

Broadcasting allows NumPy to perform an operation on multiple array elements without writing loops.

Example:

```python
a = np.array([
    [1, 2, 3],
    [3, 4, 5],
    [4, 5, 6]
])

print(a + 2)
```

NumPy automatically adds `2` to every element.

Another example:

```python
print(a * 4)
```

NumPy multiplies every element by `4`.

### Real-Life Example

If every student's marks receive **5 grace marks**, NumPy can add `5` to all marks at once.

---

# ⚡ Vectorization

Vectorization means performing operations on an entire NumPy array without writing explicit loops.

### Traditional Python List Approach

```python
a = [2, 4, 8]
b = [4, 2, 3]

c = []

for i in range(len(a)):
    c.append(a[i] * b[i])

print(c)
```

---

### NumPy Vectorized Approach

```python
a = np.array([2, 4, 8])
b = np.array([4, 2, 3])

print(a * b)
```

NumPy performs the operation directly without manually writing a loop.

---

# ➕➖✖️➗ Array Arithmetic Operations

NumPy supports element-wise arithmetic operations.

```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

print(a + b)
print(a - b)
print(a * b)
print(a / b)
```

Operations include:

- Addition
- Subtraction
- Multiplication
- Division

---

# 📊 Statistical Functions

NumPy provides useful statistical functions.

```python
a = np.array([1, 2, 3, 4, 5, 6, 7])

print(np.mean(a))
print(np.max(a))
print(np.min(a))
print(np.sum(a))
```

| Function | Purpose |
|---|---|
| `np.mean()` | Calculates the average |
| `np.max()` | Finds the maximum value |
| `np.min()` | Finds the minimum value |
| `np.sum()` | Calculates the total sum |

---

# 🎯 Learning Objective

The goal of this practice is to understand the fundamentals of **NumPy** and how it provides efficient tools for numerical computing.

This practice focuses on understanding:

- Multi-dimensional arrays
- Array manipulation
- Array slicing
- Reshaping
- Broadcasting
- Vectorization
- Mathematical operations
- Statistical operations

These concepts form an important foundation for:

- Data Analysis
- Machine Learning
- Deep Learning
- Scientific Computing

---

## 🛠️ Technologies Used

- Python 🐍
- NumPy 📊
- Jupyter Notebook 📓

---

## 📂 Repository Structure

```text
Day-21-NumPy-Fundamentals/
│
├── numpy_practice.ipynb
└── README.md
```

---

## 👨‍💻 Author

**Karan Nigal**

---

⭐ This repository is part of my **Python learning journey**.