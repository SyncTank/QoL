import math

def binomial_probability(n, k, p):
    # Calculate the binomial coefficient
    binom_coeff = math.factorial(n) / (math.factorial(k) * math.factorial(n - k))
    
    # Calculate the probability
    prob = binom_coeff * (p ** k) * ((1 - p) ** (n - k))
    
    return prob

# Number of trials
n = 12

# Probability of success on a single trial
p = 0.25

# Calculate the sum of the probabilities for k=0, k=1, and k=2
prob = sum(binomial_probability(n, k, p) for k in range(3))

# Print the result, rounded to four decimal places
print(f"The probability that fewer than three automobiles violate the standard is {prob:.4f}")
