#lang racket

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
 (accumulate append '() (map proc seq)))

(define (add-eq-S n S)
 (filter (lambda (triple) (= (+ (car triple) (cadr triple) (cadr (cdr triple))) S))
 (flatmap
 (lambda (i)
  (flatmap (lambda (j) (map (lambda (k) (list i j k)) (enumerate-interval 1 (- j 1))))
   (enumerate-interval 1 (- i 1))))
 (enumerate-interval 1 n))))

(add-eq-S 4 7)
