text = input("Enter the text:")
n = int(input("Enter no of chars to remove from above text: "))
if n >= len(text):
    print("please give n lessthan", len(text))
else:
    result = text[n:]
    print("Final string after removal of", n, result)
   
    