from rich import print
import numpy as np


def main():
    arr = np.array([x for x in range(26)])
    arr += ord("A")
    text = arr.astype(np.uint8).tobytes().decode("utf-8")
    print(f"numpy test.\n{arr=}\n{text=}")


if __name__ == "__main__":
    main()
