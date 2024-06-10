class Solution(object):
    def singleNumber(self, nums):
        from collections import Counter
        """
        :type nums: List[int]
        :rtype: int
        """
        x = Counter(nums)
        x = list(x.items())

        for i in x:
            if i[1] == 1:
                return i[0]
        
