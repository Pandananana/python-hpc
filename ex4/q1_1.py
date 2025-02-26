import numpy as np

def standardize_rows(data, mean, std):
    rows = len(data)
    cols = len(data[0])
    
    # Create a properly sized result list
    result = []
    
    # Process each row
    for n in range(rows):
        new_row = []
        
        # Process each column in this row
        for d in range(cols):
            # Calculate standardized value
            standardized_value = (data[n][d] - mean[d]) / std[d]
            new_row.append(standardized_value)
            
        # Add the completed row to our result
        result.append(new_row)
    
    return np.array(result)

data = [[1,2,3],[4,5,6]]
mean = [0.5,1,3]
std = [1,2,3]

print(standardize_rows(data,mean,std))

