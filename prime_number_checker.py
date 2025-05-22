def is_prime(n):
    if n <= 1:
        return "give a number greater than 1"
    
    for i in range(2, (n // 2) + 1):
        if n % i == 0:
            return "not prime"      
    return "prime"

print(is_prime(int(input("Enter a number to check whether it is prime or not : "))))
