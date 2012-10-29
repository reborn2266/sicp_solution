#lang racket

(define (make-monitored f)
  (define count 0)

  (define (mf m)
    (cond ((eq? m 'how-many-calls?) count)
          ((eq? m 'reset-count) (set! count 0))
          (else (set! count (+ 1 count)) (f m))))
  mf)

(define s (make-monitored sqrt))
(s 100)
(s 'how-many-calls?)
