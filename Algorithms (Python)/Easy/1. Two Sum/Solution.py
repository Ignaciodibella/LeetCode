class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        for i, num_i in enumerate(nums):
            for j, num_j in enumerate(nums):
                if i == j:
                    continue
                else:
                    if (num_i + num_j) == target:
                        return [i, j]
