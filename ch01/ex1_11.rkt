#lang racket
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (f (- n 2)) (f (- n 3)))))

(define (f-iter a b c count)
   (if (= count 0)
       c
       (f-iter (+ a b c) a b (- count 1))))

# not only the memory, but the speed enhanced a lot by running iterative one
(f 35)
(f-iter 2 1 0 35)
