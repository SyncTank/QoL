import math

n = 1000
k = 2
p = .005

comb = math.comb(n, k)

prob = comb * (p**k) * ((1-p)**(n-k))

print(f"{prob:.4f}")
