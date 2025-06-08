def display(**kwargs):  #*args allows a function to accept any num of keyword args key value pair args
    for key, value in kwargs.items():
        print(f"{key}: {value}")

display(name="sri", city="hyd")