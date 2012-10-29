#lang racket

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

 (define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (in sym sym-list)
  (cond ((null? sym-list) '#f)
        ((eq? sym (car sym-list)) '#t)
        (else (in sym (cdr sym-list)))))

(define (encode-symbol sym branch)
  (cond ((leaf? branch)
          (if (eq? (symbol-leaf branch) sym)
              '()
              (error "bab sym " sym)))
        ((in sym (symbols (left-branch branch))) (cons '0 (encode-symbol sym (left-branch branch))))
        ((in sym (symbols (right-branch branch))) (cons '1 (encode-symbol sym (right-branch branch))))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

;; testing

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-encoded-msg '(0 1 1 0 0 1 0 1 0 1 1 1 0)) 

(define sample-decoded-msg '(A D A B B C A))

(decode sample-encoded-msg sample-tree)
(encode sample-decoded-msg sample-tree)
