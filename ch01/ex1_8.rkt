#lang racket

(define (improve y x)
  (/ (+ (/ x (* y y)) (* 2 y)) 3.0))

(define (good-enough? x y)
  (and (< (/ x y) 1.001) (> (/ x y) 0.999)))

(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x))
          guess
          (cube-root-iter (improve guess x)
                     x)))

;; following would not be correct before this modification due to
;; small number is restricted by epsilon and large number is restricted by float precision
(cube-root-iter 1.1  8)
