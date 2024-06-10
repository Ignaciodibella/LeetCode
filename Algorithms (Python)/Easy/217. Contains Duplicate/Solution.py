class Solution(object):
    def containsDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        numeros_vistos = set()
        for num in nums:
            if num in numeros_vistos:
                return True
            numeros_vistos.add(num)
        return False
