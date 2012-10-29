#lang racket

(define (reverse L)
  (cond ((null? L) '())
        (else (append (reverse (cdr L)) (list (car L))))))

(define (deep-reverse L)
  (cond ((null? L) '())
        ((pair? (car L)) (append (deep-reverse (cdr L)) (list (deep-reverse (car L)))))
        (else (append (deep-reverse (cdr L)) (list (car L))))))

(define x (list (list 1 2) (list 3 4 (list 5 6 7))))

(reverse x)
(deep-reverse x)
