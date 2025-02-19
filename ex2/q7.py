class Student:
    def __init__(self, name, courses):
        self.name = name
        self.courses = courses

    def attends(self, course):
        if course in self.courses:
            return True
        else:
            return False

s = Student('X', ['01005', '02613'])
print(s.attends('01005'))
print(s.attends('02613'))
print(s.attends('02510'))
