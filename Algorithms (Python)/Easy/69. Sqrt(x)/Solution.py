# Método de Herón
class Solution:
    def mySqrt(self, x: int) -> int:
        if x == 0:
            return 0
        xi = x / 2
        while True:
            xn = 0.5 * (xi + x/xi)
            if abs(xn - xi) < 0.1:
                break
            xi = xn
        return int(xn)
