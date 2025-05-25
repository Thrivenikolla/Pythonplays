# Check given num is prime or not
a = int(input("Enter a number to check whether it is prime or not : "))
is_prime = True

if a <= 1:
    print("NOTE: Please provide values starting from 2")
elif a >= 2:

    for i in range(2, a // 2 + 1):
        if a % i == 0:
            is_prime = False
            break
        else:
            is_prime = True
            
    if is_prime:
        print(a, "is prime number")
    else:
        print(a, "is not prime number")
