
class EagerClass(object):
    def __init__(self, function, value):
        self.function = function
        self.value = value
        
    def __call__(self, *numbers):
        newNum = self.value
        for num in numbers:
            newNum = self.function(newNum, num)
            num += 1
        return EagerClass(self.function, newNum)

    def __str__(self):
        string = str(self.value)
        return string
    
class LazyClass(object):
    def __init__(self, function, value):
        self.function = function
        self.value = value
        
    def __call__(self, *numbers):
        for num in numbers:
            self.value +=  num
            num += 1
        return LazyClass(self.function, self.value)
    
    def __str__(self):
        newNum = self.function(0, self.value)
        string = str(newNum)
        return string 

def curry(function, value, string = ""):
    if string == "":
        return EagerClass(function, value)
    else:
        return LazyClass(function, value)
    
def sleepingAdd(x, y):
    import time
    for i in xrange(0, y):
        print ".",
        time.sleep(1);
    return x + y;

print "Test1:   "

add2 = lambda x, y : x + y  
adder = curry(add2, 5) 
adder = adder(3) 
print adder() 
print adder(2)() 
print adder(1)() 
adder = adder(3) 
print adder() 
print

print "Test2:   "

adder0 = curry(add2, 0, "") 
adder18 = adder0(3)(4,5)(6)
print adder18() 
print adder18(2)() 
print

lazyAdder0 = curry(add2, 0, 'Lazy')
lazyAdder18 = lazyAdder0(3)(4,5)(6)
print lazyAdder18() 
print lazyAdder18(2)() 
print

print "Test3:   "

sadder0 = curry(sleepingAdd, 0)
print "Hey",
sadder10 = sadder0(3)(4,2)(1)  
print "Yo"
print sadder10() 
print "Hey",
sadder10() 
print "Yo"
print
    
lazySadder0 = curry(sleepingAdd, 0, 'Lazy')
print "Hey",
lazySadder10 =  lazySadder0(3)(4,2)(1) 
print "Yo"
print lazySadder10() 
print "Hey",
lazySadder10() 
print "Yo"

print "Ends   "
