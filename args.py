def sum_num(*args): #*args allows a function to accept any num of positional args it is tuple contains all passed args
    total = 0
    for num in args:
        total += num
    return total
    
print(sum_num(1, 9, 33))
print(sum_num(1, 9, 8, 2, 5))