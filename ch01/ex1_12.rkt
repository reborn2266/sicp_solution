#lang racket

(define (pascal n k)
   (if (or (< n 2) (= k 1) (= k n))
       1
       (+ (pascal (- n 1) (- k 1)) (pascal (- n 1) k)
       )
   )
)

(= (pascal 1 1) 1)
(= (pascal 2 1) 1)
(= (pascal 3 2) 2)
(= (pascal 3 1) 1)
(= (pascal 4 2) 3)
(= (pascal 5 3) 6)
