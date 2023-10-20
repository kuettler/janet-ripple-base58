(use ripple-base58)

(assert (= (encode "1") "i"))
(assert (= (encode "2") "1"))
(assert (= (encode "3") "t"))

(assert (= (checked-encode "1") "raXzq11d"))
(assert (= (checked-encode "2") "ra5LLy4U"))
(assert (= (checked-encode "3") "raFW9Ndn"))

(def msg "123456789abcdefghjklmnpqrstuvwxyzabcdefghijkmnopqrstuvwxyz")
(assert (= (decode (encode msg)) msg))

(def [result version] (checked-decode (checked-encode "abcd" 7)))
(assert (= result "abcd"))
(assert (= version 7))

(assert (= [msg 8] (checked-decode (checked-encode msg 8))))
