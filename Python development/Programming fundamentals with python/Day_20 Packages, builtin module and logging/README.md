# 📦 Python Modules Practice

This repository contains my practice and learning of **Python Modules**, including the built-in **`math`** and **`logging`** modules.

---

## 📚 Topics Covered

- Understanding Python Modules
- Python Standard Library
- `math` Module
- Mathematical Functions
- Mathematical Constants
- Square Roots and Nth Roots
- `logging` Module
- Logging Levels
- Configuring Logging
- Writing Logs to Files
- Displaying Logs in Terminal
- Custom Log Formatting
- Exception Handling with Logging

---

# 🧩 What is a Module?

A **module** is a Python file containing reusable Python code such as:

- Functions
- Variables
- Classes

Python provides many built-in modules through its **Standard Library**.

Example:

```python
import math
```

Here, `math` is a built-in Python module.

---

# 🧮 Math Module

The `math` module provides useful mathematical functions and constants.

```python
import math
```

## Square Root

```python
print(math.sqrt(81))
```

### Output

```text
9.0
```

---

## Ceiling and Floor

### `math.ceil()`

Rounds a number upwards.

```python
print(math.ceil(4.5))
```

### Output

```text
5
```

### `math.floor()`

Rounds a number downwards.

```python
print(math.floor(4.5))
```

### Output

```text
4
```

---

## Power

```python
print(math.pow(2, 3))
```

### Output

```text
8.0
```

---

## Finding the Nth Root of a Number

The formula for finding the nth root is:

```text
number ** (1 / n)
```

Example:

```python
number = 16
n = 4

result = number ** (1 / n)

print(result)
```

### Output

```text
2.0
```

---

# 🔢 Mathematical Constants

The `math` module contains useful mathematical constants.

| Constant | Description |
|---|---|
| `math.pi` | Value of π (Pi) |
| `math.e` | Euler's Number |
| `math.tau` | 2 × π |
| `math.inf` | Positive Infinity |
| `math.nan` | Not a Number |

Example:

```python
import math

print(math.pi)
print(math.e)
print(math.tau)
print(math.inf)
print(math.nan)
```

---

# 📝 Logging Module

The `logging` module is used to track events and messages during the execution of a Python program.

It is useful for:

- Debugging programs
- Tracking program execution
- Recording errors
- Monitoring application behavior

```python
import logging
```

---

# 🚦 Logging Levels

Python provides different levels of logging:

| Level | Value | Purpose |
|---|---:|---|
| `DEBUG` | 10 | Detailed debugging information |
| `INFO` | 20 | General information |
| `WARNING` | 30 | Warning messages |
| `ERROR` | 40 | Error messages |
| `CRITICAL` | 50 | Serious errors |

Example:

```python
logging.debug("Debug message")
logging.info("Information message")
logging.warning("Warning message")
logging.error("Error message")
logging.critical("Critical message")
```

---

# ⚙️ Configuring Logging

The `basicConfig()` function is used to configure logging.

Example:

```python
import logging

logging.basicConfig(
    filename="applog.log",
    level=logging.INFO,
    filemode="w"
)
```

This configuration:

- Creates or uses the `applog.log` file
- Sets the logging level to `INFO`
- Uses write mode (`w`)

---

# 📁 Logging to a File

```python
import logging

logging.basicConfig(
    filename="applog.log",
    level=logging.INFO,
    filemode="w"
)

logging.debug("Debug information")
logging.info("Information message")
logging.warning("Warning message")
logging.error("Error message")
logging.critical("Critical message")
```

---

# 💻 Logging in the Terminal

Logs can also be displayed directly in the terminal.

```python
import logging

logging.basicConfig(level=logging.INFO)

logging.info("Information message")
logging.warning("Warning message")
logging.error("Error message")
```

---

# 🎨 Custom Log Format

The format of log messages can be customized using the `format` parameter.

```python
import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)
```

This format can display:

- Date and time
- Logging level
- Log message

---

# 🛡️ Exception Handling with Logging

Logging can be combined with `try-except` blocks to record errors and important program events.

```python
import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

try:
    num1 = int(input("Enter first number: "))
    num2 = int(input("Enter second number: "))

    logging.info("Numbers entered successfully")

    result = num1 / num2

    logging.info("Division completed successfully")

    print(result)

except ZeroDivisionError:
    logging.error("Cannot divide by zero")

except ValueError:
    logging.warning("Invalid input entered")

except Exception as e:
    logging.critical(f"Unexpected error: {e}")
```

---

# 🎯 Learning Objective

The purpose of this practice is to understand how **Python Modules** provide reusable functionality and how built-in modules such as **`math`** and **`logging`** can be used in Python programs.

---

## 🛠️ Technologies Used

- Python 🐍
- Jupyter Notebook

---

## 📂 Repository Structure

```text
Python-Modules-Practice/
│
├── python_modules.ipynb
├── README.md
└── applog.log
```

---

## 👨‍💻 Author

**Karan Nigal**

---

⭐ This repository is part of my Python learning journey.