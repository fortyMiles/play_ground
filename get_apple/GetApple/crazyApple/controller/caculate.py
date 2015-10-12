import random
import time


class Caculater:
    def __init__(self):
        self.operation_num = 3
        self.min = -10
        self.max = 10
        self.max_num = 100
        self.min_num = -100
        self.operations = ['*', '/', '+', '-']
        self.ans = [3, 4, 5, 6]
        self.opra_nums = [0]*4

    def get_num(self):
        return random.randint(self.min_num, self.max_num)

    def num_okay(self, ans):
        if ans >= 3 and ans <= 6:
            return True
        else:
            return False

    def operator_num_okay(self, num):
        if abs(num) < 10:
            return False, 0, 0

        num_list = []
        if num % 2 == 0:
            num_list = range(10, 1, -1)
        else:
            num_list = range(2, 11)

        for i in num_list:
            if abs(i) <= 1:
                continue
            elif num % i == 0 and abs(num/i) < 11:
                chushu, beichushu = i, num/i
                if beichushu < 0:
                    chushu, beichushu = beichushu, chushu
                return True, chushu, beichushu
            else:
                continue
        return False, 0, 0

    def get_num1_and_num2(self):
        time1 = time.time()
        while True:
            chosed_num_1 = self.get_num()
            chosed_num_2 = self.get_num()
            operation = random.randint(0, 2)

            ans = None
            operator = ""
            if operation == 0:
                ans = chosed_num_1 + chosed_num_2
                operator = '+'
            elif operation == 1:
                ans = chosed_num_1 - chosed_num_2
                operator = '-'

            num1_okay, self.opra_nums[0], self.opra_nums[1] = self.operator_num_okay(chosed_num_1)
            num2_okay, self.opra_nums[2], self.opra_nums[3] = self.operator_num_okay(chosed_num_2)

            if self.num_okay(ans) and num1_okay and num2_okay:
                print 'used time = %s' % (time.time() - time1)
                if self.opra_nums[2] < 0:
                    self.opra_nums[2] = abs(self.opra_nums[2])
                    if operator == '+':
                        operator = '-'
                    else:
                        operator = '+'
                return self.opra_nums, operator, ans
            else:
                continue

    def test(self):
        self.get_num1_and_num2()

if __name__ == '__main__':
    gamer = Caculater()
    for i in range(100):
        gamer.test()
