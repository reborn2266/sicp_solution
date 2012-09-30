#lang racket

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (good-enough? x y)
  (and (< (/ x y) 1.001) (> (/ x y) 0.999)))

(define (sqrt-iter guess x)
  ;; use the author's suggestion, compare the guess and the next improved guess
  ;; therefore, we can prevent the x's numeric range as possible
  (if (good-enough? guess (improve guess x))
          guess
          (sqrt-iter (improve guess x)
                     x)))

;; following would not be correct before this modification due to
;; small number is restricted by epsilon and large number is restricted by float precision
(sqrt-iter 1.0  0.0005)
