class Test(object):
    NAME = 'name'
    self_name = NAME + '_self'

    def __init__(self, name):
        self.name = name

    @classmethod
    def name(cls):
        return cls.self_name

    @staticmethod
    def test_static():
        return Test.NAME

    @classmethod
    def create_test(cls, name):
        return cls(name)
