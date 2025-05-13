A = [1, 2, 3, 4, 5]
#A = [1, 2, 3, 4, 5]
#A = [1, 2, 2, 2, 3, 4]

T = int(input("Enter a target integer"))
for i in range(A):
  if A[i] == T:
    print(i)
  elif A[i] != T:
    print(-1)
