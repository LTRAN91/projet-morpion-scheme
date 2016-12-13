#lang racket

(define (new-board sz)
  (define (new-row)(build-list sz (lambda(l) 0 )))
  (build-list sz (lambda(l)(new-row))))

(new-board 10)

;(define (board-at board x y)
;  (list-ref (list-ref board y) x)) ;cible case


;(board-at (new-board 10) 2 3)

(define (joueurs n)
        (if ( = n 1)
          (begin
            (display " Au tour de joueur 1")
            (position (new-board 10) 1)
            (joueurs (+ n 1)))
          (begin
            (display " Au tour de joueur 2")
            (position (new-board 10) 2)
            (joueurs (- n 1)))))

(define (position board j )
  (display "choisir la ligne et la colonne: ")
  (newline)
  (let ((x (read)))
    (let((y (read)))
      (list-ref (list-ref board x) y)
      (let ((z (list-ref (list-ref board x) y)))
        (if( = j 1)
           (lambda (z) 1)
             
           (lambda (z) 2))))))

(define(remplace y board x )
 ; (list-ref board x)
  (if (= y 1)
      (cons 1 (rest (list-ref board x)))
      (cons (first (list-ref board x)) (remplace (- y 1)(rest board) x ))))
(remplace 5 (new-board 10) 2)

;trouver moyen de substituer " " par 1/2
;(lambda (list-ref (list-ref board x) y) 1))))

;(position (new-board 10))

;(joueurs 1)
  
