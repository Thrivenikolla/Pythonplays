def primenum_in_range(startnum, endnum):
    if startnum < 2:
        startnum = 2
    for num in range(startnum, endnum + 1):
        is_prime = True
        for i in range(2, num // 2 + 1 ):
            if num % i == 0:
                is_prime = False
                break
        if is_prime:
            print(num, "is a prime number")

start = int(input("Enter the starting numberof the range: "))
end = int(input("Enter the ending number of the range: "))

print(f"Prime numbers from {start} and {end} are: ")
primenum_in_range(start, end)

