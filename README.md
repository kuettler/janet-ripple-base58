# base58

Functions to base58 encode and decode messages. Including messages with
checksum and version byte, as used by ripple's XRP.

This is a wrapper around [the C functions by Luke Dashjr](https://github.com/luke-jr/libbase58).

## Implementation details

The difference between [the original (bitcoin)
version](https://github.com/kuettler/janet-base58) and the ripple version
really is just the alphabet used. In case of ripple it is
```
rpshnaf39wBUDNEGHJKLM4PQRST7VWXYZ2bcdeCg65jkm8oFqi1tuvAxyz
```
see the XRPL documentation [base58 Encodings](https://xrpl.org/base58-encodings.html#base58-encodings).

However, it is more efficient to create a new package, since the alphabet is
tightly integrated in Luke's C implementation.

The reverse map `b58digits_map` has been generated using
```
(def b58digits_ordered "rpshnaf39wBUDNEGHJKLM4PQRST7VWXYZ2bcdeCg65jkm8oFqi1tuvAxyz")
(def b58digits_map (array/new-filled 128 -1))
(loop [[i ch] :pairs (zipcoll (range 58) b58digits_ordered)]
  (put b58digits_map ch i))

(each line (partition 16 b58digits_map)
  (prin "\t")
  (each block (partition 8 line)
    (prin (string/join (seq [i :in block]
                            (string/format "%2d," i))))
    (prin " "))
  (print))
```
