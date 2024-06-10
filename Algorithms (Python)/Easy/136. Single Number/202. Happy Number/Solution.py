class Solution(object):
    def isHappy(self, n):
        """
        :type n: int
        :rtype: bool
        """
        seen = set()  # Set to keep track of numbers we have seen before
    
        while n != 1:
            n = sum(int(digit) ** 2 for digit in str(n))  # Calculate the sum of squares of digits
            
            if n in seen:
                return False  # Detected a cycle, not a happy number
            
            seen.add(n)  # Add current number to the set of seen numbers
        
        return True  # n equals 1, it is a happy number
