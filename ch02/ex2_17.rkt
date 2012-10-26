#lang racket

(define (last-pair L)
  (cond ((null? L) '())
        ((null? (cdr L)) (car L))
        (else (last-pair (cdr L)))))

(last-pair (list 23 72 149 34))
