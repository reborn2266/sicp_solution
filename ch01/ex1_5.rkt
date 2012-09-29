#lang racket
(define (p) (p))

(define (test x y)
	(if (= x 0)
		0
		y))

;; this should be evaluated 0, because p is defined as a function returning itself
;; which means that if use normal order, there is no end of subsitution before evaluation
(test 0 p)
