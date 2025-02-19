class Student:
    def __init__(self, name, courses):
        self.name = name
        self.courses = courses

    def attends(self, course):
        if course in self.courses:
            return True
        else:
            return False

def coursestudents(students, course):
    students_in_course = []
    for student in students:
        if student.attends(course):
            students_in_course.append(student.name)
    return students_in_course


students = [Student('A', ['01005']), Student('B', ['02613']),Student('C', ['01005', '02613'])]
print(coursestudents(students, '02613'))
