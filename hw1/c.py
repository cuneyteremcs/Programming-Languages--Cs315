import numpy as np
global adjacent_list

def adjacency_generator(file_name):
    data_in_file = open(file_name, 'r')

    data_in_file.readline()
    num_nodes = int(data_in_file.readline())

    line = data_in_file.readline()
    while (not "edges" in line):
        line = data_in_file.readline()

    for line in data_in_file:
        arr = [int(line) for line in line.split() if line.isdigit()]
        #print (arr)
        adjacent_list.append(arr)

    #print (adjacent_list)
    matrix_A = np.matrix([[0]* num_nodes] * num_nodes)

        
    for element in adjacent_list:
        matrix_A[element[0], element[1]] = 1
        matrix_A[element[1], element[0]] = 1

    print (matrix_A)

def num_paths(num_nodes, adjacent_list, m):
    matrix_A = np.matrix([[0]* num_nodes] * num_nodes)
    
    #print (adjacent_list)
    
    for element in adjacent_list:
        matrix_A[element[0], element[1]] = 1
        matrix_A[element[1], element[0]] = 1
    
    orginal_mat = np.copy(matrix_A)
    
    
    for i in range(0, m - 1):
        matrix_A = np.dot(matrix_A, orginal_mat)
  
    
    print(matrix_A)

adjacent_list = []
adjacency_generator('data.txt')
num_paths(5, adjacent_list, 4)
