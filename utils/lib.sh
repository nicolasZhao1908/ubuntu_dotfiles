pdf2png(){
    gs -sDEVICE=pngalpha -o static-%03d.png -r144 $1
}
