#lang racket

(define (reverse L)
  (cond ((null? L) '())
        (else (append (reverse (cdr L)) (list (car L))))))

(reverse (list 1 4 9 16 25))
