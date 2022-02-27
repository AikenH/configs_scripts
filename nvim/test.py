"""
@AikenHong 2022
@Desc: test the configuration of nvim
"""

from time import time

def sayhi(words:str):
    print("{} at {}".format(words, time()))
    print(__doc__)

if __name__ == "__main__":
    sayhi("hello nvim")

