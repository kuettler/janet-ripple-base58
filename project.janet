(declare-project
  :name "ripple-base58"
  :description ```Base 58 encoding/decoding with the ripple alphabet.```
  )

(def cflags '[])
(def lflags '["-lcrypto"])

(declare-native
  :name "ripple-base58"
  :source @["module.c" "base58.c"]
  :cflags [;default-cflags ;cflags]
  :lflags [;default-lflags ;lflags]
  )
