#lang racket

; https://www.moparscape.org/community/general-programming/158/racket-tic-tac-toe/633701

(define (new-board sz)
  (define (new-row)(build-list sz (lambda(l)" ")))
  (build-list sz (lambda(l)(new-row))))

(new-board 10)

(define (board-at board x y)
  (list-ref (list-ref board y) x)) ;cible case


(board-at (new-board 10) 2 3)

(define (is-avail? board x y)
  (string=? (board-at board x y)" ")) ;vérifie que case est bien vide

(define (is-marked? board c x y)
  (string=? (board-at board x y) c)) ;vérifie que case est rempli

(define (is-win? board c)
  (or(check-horiz? board c)(check-vert? board c)(check-diag? board c)))


(define (check-horiz? board c)
  (let((sz (length board)))
    (<(count false?
              (map (lambda(y)(has-filled-row? board c y))
                   (range sz))) sz)))  ;(range 10) = (0 1 2 3...9)
                                       ;(range 10 20) = (10 11 ... 19)
(define (has-filled-row? board c y)
  (=(count (lambda(l)
              (string=? l c))(list-ref board y))(length board)))
;length = compte nb éléments ds une liste
;string=? = (string=? "a" "as" "a") #f


(define (check-vert? board c)
  (let((sz (length board)))
    (<(count false?
              (map (lambda(x)(has-filled-column? board c x))
                   (range sz))) sz)))
 
(define (has-filled-column? board c x)
  (let((sz (length board)))
    (=(count (lambda(b)(not(false? b)))
              (map (lambda(l)
                     (string=? (list-ref (list-ref board l) x) c))
                   (range sz))) sz)))
 


(define (check-diag? board c)
  (let((sz (length board)))
    (define (check-right-diag?)
      (zero? 
       (count false?
              (map (lambda(n)
                     (is-marked? board c n (- sz 1 n)))(range sz)))))
    (define (check-left-diag?)
      (zero?
       (count false?
              (map (lambda(n)
                     (is-marked? board c n n))(range sz)))))
    (or(check-right-diag?)(check-left-diag?))))