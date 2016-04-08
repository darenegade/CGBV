# Aufgabe 1.1

# Aufgab1 1.2

## 1. Brightness_Contrast

## 2. Gauss3x3

## 3. Gauss5x5

## 4. Gauss7x7
Wie bereits beim 5x5 Gauss-Filter wurde auch hier einfach der Code des 3x3-Filters kopiert und die Anzahl der Schleifendurchläufe in diesem Fall auf 49 erhöht.

### Zeiteinsparung durch aufteilung in Vertikal und Horizontal

#### Grundmessung 7x7 mit 2 Passes
ca. 103 FPS

#### Messung mit 2 Passes nach aufteilung in vertikalen und horizontalen Gaussfilter
Im Shader Gauss5x5 wurde die offsets-Matrix in einen horizontalen Vektor mit der Höhe 7 angepasst, in Gauss7x7 wurde ein einzeiliger Vektor mit der breite 7 erstellt. Beide Shader in Kombination erzielen nun das gleiche Ergebnis wie die ursprüngliche Implementierung des Gauss7x7, allerdings wesentlich schneller.

Ergebniss der Messung: ca 440 FPS
Dies entspricht einer Performance-Steigerung von ca. 338%.

Die Einsparung kommt durch die wesentlich geringere ANzahl an Operationen je Pixel. Während beim regulären 7x7 Gaussfilter auch diagonale Werte für jeden Pixel mit in die Berechnung einbezogen werden spart man sich dies bei der Aufteilung in eine vertikale und eine horizontale Berechnung. So spart man sich je Pixel knapp 35 Operationen.
