class Solution(object):
    def searchInsert(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        for i, num in enumerate(nums):
            if num == target:
                return i
            elif num > target:
                return i
            else:
                continue
        return len(nums)
