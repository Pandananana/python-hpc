def squarecubes(arr):
    squares = []
    cubes = []
    for i in arr:
        squares.append(i**2)
        cubes.append(i**3)

    return (squares, cubes)

print(squarecubes([1, 2, 3, 4]))