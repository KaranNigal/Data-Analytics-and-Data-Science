def create_number_list():
    numbers=[]
    n=int(input('Enter the numbers of elements in list'))
    for i in range(n):
        num= int(input(f'Enter the number {i+1}'))
        numbers.append(num)
    return numbers

def display_menu():
    print('/n Number Search Program')
    print('See the options and and enter the number of the option you wnat to execute')
    print('')

def search_exact(numbers):
    pass

def search_greater_than(numbers):
    pass

def search_less_than(numbers):
    pass

def search_within_range(numbers):
    pass

def main():
    pass

if __name__=='__main__':
    main()