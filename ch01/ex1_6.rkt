#lang racket
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;; this will loop forever because new-if will evaluate all three parts of arguments
;; since it is a normal procedure
;; hence, the else-clause part is going to be evaluated forever
;; Eli has a good explaination: http://eli.thegreenplace.net/2007/06/21/sicp-section-11/
;; (sqrt-iter 1.0 2)
