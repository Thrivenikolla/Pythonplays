def palindrome(string):
    if string == string[::-1]:
        return True
    else:
        return False
    
print(palindrome(input("Enter astring to check whether it is palindrome or not : ")))
