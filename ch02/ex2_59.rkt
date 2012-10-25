#lang racket

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;;(element-of-set? 3 '(1 2 3))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((not (element-of-set? (car set1) set2))
           (cons (car set1) (union-set (cdr set1) set2))
        )
	(else (union-set (cdr set1) set2))
  )
)

(union-set '() '(1 2))
(union-set '(1 2) '())
(union-set '(1 2) '(3 4 5))
(union-set '(1 2 3) '(3 4 5))
