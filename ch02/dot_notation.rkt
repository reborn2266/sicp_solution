#lang racket

(define (odd-items1  . others)
  (define (same-parity-imp i rest)
     (cond ((null? rest) '() )
           (else (cond ((= (remainder (car rest) 2) 1 ) (cons (car rest) (same-parity-imp (+ i 1) (cdr rest))))
                        (else (same-parity-imp (+ i 1) (cdr rest)))))))
  (same-parity-imp 1 others))

(define (odd-items2 . others)
  (define (get L)
     (cond ((null? L) '())
           (else (cons (car L) (pass (cdr L))))))
  (define (pass L)
     (cond ((null? L) '())
           (else (get (cdr L)))))
  (get others))

(odd-items1 1 2 3 4 5 6 7)
(odd-items2 1 2 3 4 5 6 7)
