class Solution(object):
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        min_len = min(len(s) for s in strs)
        
        for i in range(min_len):
            char = strs[0][i] 
            if any(s[i] != char for s in strs[1:]):
                return strs[0][:i]
        
        return strs[0][:min_len] 



                        


                 
