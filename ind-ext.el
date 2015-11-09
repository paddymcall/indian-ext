;; extensions to ind-util.el

(require 'ind-util)

(eval-and-compile

  (defvar indian-velthuis-table nil)
  
  (setq indian-velthuis-table  '(;; for encode/decode
    (;; vowel
     "a"   "aa"  "i"   "ii"  "u"   "uu"
     ".r"  ".l"   nil   nil  "e"   "ai"
     nil   nil   "o"   "au"  ".R"  ".L")
    (;; consonant
     "k"   "kh"  "g"   "gh"  "\"n"
     "c"   "ch"  "j"   "jh"  "~n"
     ".t"  ".th" ".d"  ".dh" ".n"
     "t"   "th"  "d"   "dh"  "n"   nil
     "p"   "ph"  "b"   "bh"  "m"
     "y"   "r"   nil   "l"   nil  nil  "v"
     "\"s"  ".s"  "s"   "h"
     nil   nil   nil   nil   nil   nil   nil   nil
     nil   nil)
    (;; misc
     "/"   ".m"  ".h"  "'"   "&"   ".o" ".")
    (;; Digits (10)
     "0" "1" "2" "3" "4" "5" "6" "7" "8" "9")
    ))


  
(defvar indian-iast-table nil)
(setq  indian-iast-table 
  '(;; for encode/decode
    (;; vowel
     "a"   "ā"  "i"   "ī" "u"   "ū"
     "ṛ"   "ḷ"  nil   nil   "e"   "ai"
     nil   nil   "o"   "au"  "ṝ" "ḹ")
    (;; consonant
     "k"   "kh"  "g"   "gh"  "ṅ"
     "c"   "ch"  "j"   "jh"  "ñ"
     "ṭ"   "ṭh"  "ḍ"   "ḍh"  "ṇ"
     "t"   "th"  "d"   "dh"  "n"   nil
     "p"   "ph"  "b"   "bh"  "m"
     "y"   "r"   nil   "l"   "L"   nil   "v"
     "ś" "ṣ"   "s"   "h"
     nil   nil   nil   nil   nil   nil   nil   nil
     nil   nil)
    (;; misc
     nil   "ṃ"   "ḥ"   "'"   nil   ".")))

(defvar indian-slp1-table nil
  "See http://www.sanskritlibrary.org/Sanskrit/pub/lies_sl.pdf."
  )
(setq  indian-slp1-table;; see http://www.sanskritlibrary.org/Sanskrit/pub/lies_sl.pdf 
  '(;; for encode/decode
    (;; vowel
     "a"   "A"  "i"   "I" "u"   "U"
     "f"   "x"  "e~"   "e1"   "e"   "E";; not sure about the e~ and e1;
     "o~"   "o1"   "o"   "O"  "F" "X");; same for 
    (;; consonant
     "k"   "K"  "g"   "G"  "N"
     "c"   "C"  "j"   "J"  "Y"
     "w"   "W"  "q"   "Q"  "R"
     "t"   "T"  "d"   "D"  "n"  nil
     "p"   "P"  "b"   "B"  "m"
     "y"   "r"   nil   "l"   "L"  nil   "v"
     "S" "z"   "s"   "h"
     nil   nil   nil   nil   nil   nil   nil   nil      ;; NUKTAS; dunno.
     "jY"   "kz")
    (;; misc
     "~"   "M"   "H"   "'"  nil "ॐ" ".")
    (;; Digits (10)
     0 1 2 3 4 5 6 7 8 9)
    (;; Inscript-extra (4)  (#, $, ^, *, ])
     "#" "$" "^" "*" "]")))

;; र य ल

(defvar indian-dev-iast-hash nil)
(setq  indian-dev-iast-hash 
  (indian-make-hash indian-dev-base-table
		    indian-iast-table))

(defvar indian-dev-slp1-hash nil)
(setq  indian-dev-slp1-hash 
  (indian-make-hash indian-dev-base-table
		    indian-slp1-table))

(defvar indian-dev-velthuis-hash nil)
(setq  indian-dev-velthuis-hash 
  (indian-make-hash indian-dev-base-table
		    indian-velthuis-table))

(defun indian-dev-velthuis-encode-region (from to)
  (interactive "r")
  (indian-translate-region
   from to indian-dev-velthuis-hash t))

(defun indian-dev-velthuis-decode-region (from to)
  (interactive "r")
  (indian-translate-region
   from to indian-dev-velthuis-hash nil))


(defun indian-dev-slp1-encode-region (from to)
  (interactive "r")
  (indian-translate-region
   from to indian-dev-slp1-hash t))

(defun indian-dev-slp1-decode-region (from to)
  (interactive "r")
  (indian-translate-region
   from to indian-dev-slp1-hash nil))

(defun indian-dev-iast-decode-region (from to)
  (interactive "r")
  (indian-translate-region
   from to indian-dev-iast-hash nil))

(defun indian-dev-iast-encode-region (from to)
  (interactive "r")
  (indian-translate-region
   from to indian-dev-iast-hash t))

;; close eval-and-compile
)
;; शास्त्रे प्रवर्तिता एव भवन्ति
(provide 'ind-ext)
