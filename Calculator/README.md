# A Simple Calculator

## Spec
* The calculator should be able to output the correct results of 𝐴 𝑜𝑝 𝐵
* −1024 ≤ 𝐴, 𝐵 ≤ 1024; 𝐴, 𝐵, 𝑜𝑝 ∈ ℤ
* If 𝑜𝑝 = 0, calculate 𝐴 + 𝐵 and output the result
* If 𝑜𝑝 = 1, calculate 𝐴 − 𝐵 and output the result
* If 𝑜𝑝 = 2, calculate 𝐴 × 𝐵 and output the result
* If 𝑜𝑝 = 3, calculate 𝐴 ÷ 𝐵 and output the result (integer division)
* If 𝑜𝑝 ∉ {0, 1, 2, 3}, you should print “𝑜𝑝 𝑛𝑜𝑡 𝑠𝑢𝑝𝑝𝑜𝑟𝑡𝑒𝑑”
* If divided by zero, you should print “𝑑𝑖𝑣𝑖𝑑𝑒𝑑 𝑏𝑦 𝑧𝑒𝑟𝑜”
* Input file will contain 3 lines. Line1: 𝐴, Line2: 𝑜𝑝, Line3: 𝐵

## Run
* `/path/to/jupiter calculator.s` then enter ex. `5 1 2` then output should be `5-2=3`.
