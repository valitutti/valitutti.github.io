Ecco le diverse tappe:

Su P5.js:
(Per uno stesso kinetic object)
1) base: linear, oscillation, pulse, exponential
2) add
3) join
4) animazioni anonime ("none") e con nome
5) creazione di una libreria di animazioni
    - insieme di attributi
    - animazione:
                  def shift_x (duration, x_end):
                    return base(linear, a, x_end)


- Allo stesso modo, vediamo la rappresentazione su json
- Successivamente una rappresentazione su python
  Ad es:
        obj = new KString(string = 'ciao', x = 0, y = 0)
        obj.getAnimation(get_joy(....
