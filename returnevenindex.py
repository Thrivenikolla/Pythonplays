# return even index from chars from given string
# with loops
# s = input("Enter the string : ")
# even_chars = ""
# for i in range(len(s)):
#     if i % 2 == 0:
#         even_chars += s[i]

# print ("Even char's under given string are :", even_chars)

#with slicing
s = input("Enter the string : ")
even_chars = s[0::2]
print ("Even char's under given string are :", even_chars)
