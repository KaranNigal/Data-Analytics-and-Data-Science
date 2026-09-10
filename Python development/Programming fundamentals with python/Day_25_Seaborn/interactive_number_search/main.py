def create_number_list():
    numbers = []
    n = int(input("Enter the number of elements in the list: "))
    for i in range(n):
        num = int(input(f"Enter number {i+1}: "))
        numbers.append(num)
    return numbers

def display_menu():
    print("\nSearch Menu:")
    print("1. Exact match search")
    print("2. Search for numbers greater than")
    print("3. Search for numbers less than")
    print("4. Search for numbers within a range")
    print("5. Exit")
    
def search_exact(numbers):
    target = int(input("Enter the number to search for: "))
    if target in numbers:
        print(f"{target} found in the list.")
    else:
        print(f"{target} not found in the list.")

def search_greater_than(numbers):
    target = int(input("Enter the number to search for greater than: "))
    result = [num for num in numbers if num > target]
    if result:
        print(f"Numbers greater than {target}: {result}")
    else:
        print(f"No numbers greater than {target} found.")

def search_less_than(numbers):
    target = int(input("Enter the number to search for less than: "))
    result = [num for num in numbers if num < target]
    if result:
        print(f"Numbers less than {target}: {result}")
    else:
        print(f"No numbers less than {target} found.")

def search_within_range(numbers):
    start = int(input("Enter the starting number of the range: "))
    end = int(input("Enter the ending number of the range: "))
    result = [num for num in numbers if start <= num <= end]
    if result:
        print(f"Numbers within the range {start} to {end}: {result}")
    else:
        print(f"No numbers found in the range {start} to {end}.")

def main():
    numbers = create_number_list()
    while True:
        display_menu()
        choice = input("Choose an option (1-5): ")
        if choice == '1':
            search_exact(numbers)
        elif choice == '2':
            search_greater_than(numbers)
        elif choice == '3':
            search_less_than(numbers)
        elif choice == '4':
            search_within_range(numbers)
        elif choice == '5':
            print("Exiting the program.")
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
