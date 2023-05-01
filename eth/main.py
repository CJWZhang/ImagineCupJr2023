from web3 import Web3, HTTPProvider
import json
import time
# 0xbb916dc9975984e1e61899b53a2c60c4326c405c225ca7684aee8ff3ae001685
# f2921720631d3af47e64b12ef21a390ddb70f7c2e3ac3a084edba60477150885
infura_url = "https://ropsten.infura.io/v3/09212346b2ea4a41825e17c86afb0d45"
private_key = "f2921720631d3af47e64b12ef21a390ddb70f7c2e3ac3a084edba60477150885"

#  pip install web3
# web 1.0/2.0/3.0

web3 = Web3(Web3.HTTPProvider(infura_url))
# prv-> pub
# public key -> address 可以公开的
# 每一次交互的tx，使用prv签名
account = web3.eth.account.from_key(private_key)

balance=web3.eth.get_balance(account.address)
print(balance)
# 0x1EaD6DdA366B26C082ec7298587061f21Aeb5f2d

with open('storage.abi', 'r') as f:
    abi = json.load(f)

# 0xb07A857248B39B0095B9c4db3dCCB092085A237c
# 0x0Be417C4549bC25228026709F2783A4869E4622C
c = web3.eth.contract("0x1EaD6DdA366B26C082ec7298587061f21Aeb5f2d", abi=abi)
print(c.all_functions())

def store():
    tx = c.functions.store(54321).buildTransaction({'gas': 1000000,
    'gasPrice': web3.toWei('21', 'gwei'), 'from': account.address,
    'nonce': web3.eth.getTransactionCount(account.address)}) # 构造交易

    signed = account.signTransaction(tx) # 用账户对交易签名	
    tx_id = web3.eth.sendRawTransaction(signed.rawTransaction) # 交易发送并获取交易id

    print(tx_id.hex())


def retrieve():
    print(c.functions.retrieve().call())

# set()
get()