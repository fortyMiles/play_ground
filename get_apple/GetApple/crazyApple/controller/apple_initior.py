from random import shuffle


class AppleInitor:
    def __init__(self):
        self.color_num = 4
        self.true_color = range(self.color_num)
        self.show_color = range(self.color_num)

    def get_color(self):
        while True:
            okay = True
            shuffle(self.true_color)
            shuffle(self.show_color)

            for t, s in zip(self.true_color, self.show_color):
                if t == s:
                    okay = False
                    break

            if okay:
                print self.true_color
                print self.show_color
                break
            else:
                continue

        return self.true_color, self.show_color

if __name__ == '__main__':
    intitor = AppleInitor()
    for i in range(100):
        print '-------------------------'
        intitor.get_color()
