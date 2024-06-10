class Solution(object):
    def romanToInt(self, s):
        """
        :type s: str
        :rtype: int
        """
        dict = (('I', 1), ('V', 5), ('X', 10), ('L', 50), ('C', 100), ('D', 500), ('M', 1000))
        dict2 = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
        
        #s = 'III'
        #s2 = 'IV'

        total = 0
        for i in range(len(s)):
            if (i+1) < len(s):
                if dict2[s[i]] < dict2[s[i+1]]:
                    total -= dict2[s[i]]
                else:
                    total += dict2[s[i]]   
            else:
                total += dict2[s[i]]
        return total
