
; *********************************************
; *  314 Principles of Programming Languages  *
; *  Fall 2014                                *
; *  Student Version                          *
; *********************************************

;; contains "ctv", "A", and "reduce" definitions
(load "include.ss")

;; contains simple dictionary with only four words
(load "test-dictionary.ss")

;; contains full dictionary 
;; (load "dictionary.ss")

;; -----------------------------------------------------
;; Simple test words 
;;   words are represented as lists of symbols, 
;;   e.g., "program" is represented as '(p r o g r a m)

(define hello '(h e l l o))
(define program '(p r o g r a m))
(define of '(o f))
(define language '(l a n g u a g e))


;; -----------------------------------------------------
;; HELPER FUNCTIONS

;; *** CODE FOR ANY HELPER FUNCTION GOES HERE ***


;; -----------------------------------------------------
;; KEY FUNCTION

(define key
  (lambda (w)
     'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***
))

;; -----------------------------------------------------
;; EXAMPLE KEY FUNCTIONS

(define key1 (key hello))   ;; ==> 40762
(define key2 (key program)) ;; ==> 1592740
(define key3 (key of))      ;; ==> 57
(define key4 (key language));; ==> 5011592


;; -----------------------------------------------------
;; HASH FUNCTION GENERATORS

;; value of parameter "size" should be a prime number
(define gen-hash-division-method
  (lambda (size) ;; range of values: 0..size-1
     'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***
))

;; value of parameter "size" is not critical
;; Note: hash functions may return integer values in "real"
;;       format, e.g., 17.0 for 17

(define gen-hash-multiplication-method
  (lambda (size) ;; range of values: 0..size-1
     'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***
))

;; value of parameter "size" should be a prime number
(define gen-hash-hybrid-method
  (lambda (size) ;; range of values: 0..size-1
     'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***
))


;; -----------------------------------------------------
;; EXAMPLE HASH FUNCTIONS AND HASH FUNCTION LISTS

;; -----------------------------------------------------
;; EXAMPLE HASH FUNCTIONS

;; ideally, size should be a prime number for division and hybrid methods

(define hash-1 (gen-hash-division-method 454711))
(define hash-2 (gen-hash-division-method 1297687))
(define hash-3 (gen-hash-multiplication-method 90000))
(define hash-4 (gen-hash-multiplication-method 180001))
(define hash-5 (gen-hash-hybrid-method 454711))
(define hash-6 (gen-hash-hybrid-method 1298687))

;; (hash-1 hello) ;; ==> 40762
;; (hash-2 hello) ;; ==> 40762
;; (hash-3 hello) ;; ==> 27130.0
;; (hash-4 hello) ;; ==> 54260.0
;; (hash-5 hello) ;; ==> 38026.0
;; (hash-6 hello) ;; ==> 1255979.0

;; (hash-1 language) ;; ==> 9771
;; (hash-2 language) ;; ==> 1118531
;; (hash-3 language) ;; ==> 17414.0
;; (hash-4 language) ;; ==> 34829.0
;; (hash-5 language) ;; ==> 283497.0
;; (hash-6 language) ;; ==> 387564.0


;; (hash-1 of) ;; ==> 57
;; (hash-2 of) ;; ==> 57
;; (hash-3 of) ;; ==> 20514.0
;; (hash-4 of) ;; ==> 41028.0
;; (hash-5 of) ;; ==> 311049.0
;; (hash-6 of) ;; ==> 888171.0


;; -----------------------------------------------------
;; EXAMPLE HASH FUNCTION LISTS

(define hashfl-1 (list hash-1 hash-2 hash-3 hash-4))
(define hashfl-2 (list hash-1 hash-3))
(define hashfl-3 (list hash-1 hash-4 hash-5 hash-6))


;; -----------------------------------------------------
;; SPELL CHECKER GENERATOR

(define gen-checker
  (lambda (hashfunctionlist dict)
     'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***
))


;; -----------------------------------------------------
;; EXAMPLE SPELL CHECKERS

(define checker-1 (gen-checker hashfl-1 dictionary))
(define checker-2 (gen-checker hashfl-2 dictionary))
(define checker-3 (gen-checker hashfl-3 dictionary))



;; EXAMPLE APPLICATIONS OF A SPELL CHECKER
;;
;;  (checker-1 '(l o h a)) ==> #t
;;  (checker-2 '(l o h a)) ==> #t
;;  (checker-2 '(h e l l o)) ==> #t
;;  (checker-3 '(o f)) ==> #t
;;  (checker-3 language)  ==> #t
;;  (checker-1 '(w h a t f u n)) ==> #f
;;  (checker-2 '(w h a t f u n)) ==> #f
;;  (checker-3 '(w h a t f u n)) ==> #f


