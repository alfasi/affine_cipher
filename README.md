# Affine Cipher
Encrypt and guess decryption of message.

### Encrypt
Encrypt "hello world" with A => 5, B => 17

`sh
$ ruby affine_cipher.rb encrypt 5 17 hello world
`
output:
`sh
ALUUJ XJYUG
`

### Decrypt
Decrypt "ALUUJ XJYUG" without known keys

`sh
$ ruby affine_cipher.rb decrypt ALUUJ XJYUG
`

output:
`sh
hello world
`
