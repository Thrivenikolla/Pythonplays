def even_odd(n):
    if n % 2 == 0:
        return f"{n} is even"
    else:
        return f"{n} is odd"


print(even_odd(int(input("Enter a number to check whether it is even or odd : "))))
