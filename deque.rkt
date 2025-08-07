#lang r5rs

(define (make-node value)
  (cons value (cons '() '())))

(define (node-value node)
  (car node))

(define (predecessor-node node)
  (cddr node))

(define (succsessor-node node)
  (cadr node))

(define (set-node-predecessor! node prev)
  (set-cdr! (cdr node) prev))

(define (set-node-succsessor! node next)
  (set-car! (cdr node) next))

(define empty-node (make-node '()))

(define (make-deque)
  (cons empty-node empty-node))

(define (front-node deque)
  (car deque))

(define (rear-node deque)
  (cdr deque))

(define (set-front-node! deque node)
  (set-car! deque node))

(define (set-rear-node! deque node)
  (set-cdr! deque node))

(define (set-bounds! deque node)
  (set-front-node! deque node)
  (set-rear-node! deque node))
  
(define (empty? deque)
  (eq? (car deque) empty-node))

(define (front deque)
  (if (empty? deque)
      (display "Can't use front on an empty deque")
      (node-value (front-node deque))))

(define (rear deque)
  (if (empty? deque)
      (display "Can't use rear on an empty deque")
      (node-value (rear-node deque))))

(define (front-insert! deque value)
  (let ((new-node (make-node value)))
    (cond ((empty? deque)
           (set-bounds! deque new-node))
          (else
           (set-node-succsessor! (front-node deque) new-node)
           (set-node-predecessor! new-node (front-node deque))
           (set-front-node! deque new-node)))))

(define (rear-insert! deque value)
  (let ((new-node (make-node value)))
    (cond ((empty? deque)
           (set-bounds! deque new-node))
          (else
           (set-node-predecessor! (rear-node deque) new-node)
           (set-node-succsessor! new-node (rear-node deque))
           (set-rear-node! deque new-node)))))

(define (front-delete! deque)
  (cond ((empty? deque) (display "Can't delete from an empty deque"))
        ((null? (predecessor-node (front-node deque)))
         (set-bounds! deque empty-node))
        (else
         (set-front-node! deque (predecessor-node (front-node deque)))
         (set-node-succsessor! (front-node deque) '()))))

(define (rear-delete! deque)
  (cond ((empty? deque) (display "Can't delete from an empty deque"))
        ((null? (succsessor-node (rear-node deque)))
         (set-bounds! deque empty-node))
        (else
         (set-rear-node! deque (succsessor-node (rear-node deque)))
         (set-node-predecessor! (rear-node deque) '()))))
         