#lang racket

(define (repeated f n)
   (lambda (x)
     (if (= n 1)
         (f x)
         ((compose f (repeated f (- n 1))) x))
))

(define (compose f g)
   (lambda (x) (f (g x)))
)

(define (smooth f dx)
   (lambda (x)
       (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3.0
       )
   )
)

(define (square x) (* x x))

((repeated (smooth square 0.001) 3) 2)
