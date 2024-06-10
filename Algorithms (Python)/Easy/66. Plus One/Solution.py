class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        number = []
        for num in digits:
            number.append(str(num))
        number = ''.join(number)
        new = int(number)+1

        number = []
        for num in str(new):
            number.append(int(num))
        return number
