import math

n = 12
k = 0
p = 0.25

# Calculate combinations
combinations = math.comb(n, k)

# Calculate probability
probability = combinations * (p**k) * ((1-p)**(n-k))

# Round to four decimal places
probability = round(probability, 4)

print(probability)
