#lang racket

(define (equal? L1 L2)
  (cond ((and (null? L1) (null? L2) '#t))
        ((and (null? L1) (not (null? L2) '#f)))
        ((and (null? L2) (not (null? L1) '#f)))
        ((and (eq? (car L1) (car L2)) (equal? (cdr L1) (cdr L2))))
        (else '#f)))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
