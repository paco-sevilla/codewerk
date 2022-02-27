import unittest

from hello.hello_pybind import add

class TestPybind(unittest.TestCase):

    def test_add(self):
        self.assertEqual(add(1, 2), 3)

if __name__ == '__main__':
    unittest.main()