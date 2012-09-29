#lang racket

(define (square x) (* x x))

(define (sum-of-square x y) (+ (square x) (square y)))

(define (f x y z) 
	(
		cond ((and (>= x z) (>= y z)) (sum-of-square x y))
			 ((and (>= x y) (>= z y)) (sum-of-square x z))
			 ((and (>= y x) (>= z x)) (sum-of-square y z))
	)
)

(= (f -1 0 2) 4)
(= (f 5 0 2)  29)
(= (f 5 3 2)  34)
