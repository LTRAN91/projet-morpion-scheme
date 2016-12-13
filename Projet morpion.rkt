#lang racket

; Programme du jeu morpion 100 X 100 (imcomplet)

; Création d'une matrice de taille sz.

(define (tableau sz)
  (define (new-range)(build-list sz (lambda(l) 0 )))
  (build-list sz (lambda(l)(new-range))))

; Test de la fonction (tableau 10).

; Création d'une fonction cherchant la position ciblée par les joueurs dans la matrice.


(define (position board j )
  (newline)
  (display "choisis le numéro de la rangée et le numéro de l'élément dans la rangée: ")
  (newline)
  (let ((x (read)))     ; La fonction let affecte à x la valeur choisit par l'utilisateur.
    (let((y (read)))
      (list-ref (list-ref board x) y)
      (let ((z (list-ref (list-ref board x) y)))
        (if( = j 1)     ; La variable j représente le joueur.
           (cons 1 (lambda (z) z ))    
           (cons 2 (lambda (z) z )))))))

; Création du système tour à tour du jeu.


(define (joueurs n tour)
  (if (= tour 0)    ; La variable tour représente le nombre de tours des 2 joueurs.
      (void)
      (if ( = n 1)
          (begin
            (display " Au tour de joueur 1")
            (position (tableau 10) 1)
            (joueurs (+ n 1) ( - tour 1)))
          (begin
            (display " Au tour de joueur 2")
            (position (tableau 10) 2)
            (joueurs (- n 1) (- tour 1))))))

; Test de la fonction (joueur 1 4)

; Problème : le programme n'affiche pas la matrice avec les nouvelles données.
; Il manque les fonctions de conditions gagnantes, d'égalités, joueur vs machine.