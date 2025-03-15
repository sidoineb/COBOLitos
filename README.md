# COBOLitos
*COBOLitos Quantum*

![](COBOLitos.webp)

## Description

COBOLitos-Quantum est un projet singulier de boite à outils autour de différents calculs quantiques de base.
Il est écrit en COBOL pour sa partie frontend, et en Python pour sa partie backend (Car COBOL ne permet pas le calcul de matrices, ni de nombres complexes).

## License

COBOLitos est sous license libre GNU GPL (https://www.gnu.org).

## Installation

Modules Python requis :
- Flask
- Numpy

**Pour Linux :**
```bash
sudo apt-get install python3-flask python3-numpy
```
Puis donner les droits d'exécution au script Run_quantum.sh :
```bash
chmod +x Run_quantum.sh
```
et enfin, lancez le script Run_quantum.sh:
```bash
./Run_quantum.sh
```
**Pour Windows :**
Lancez Run_quantum.bat
