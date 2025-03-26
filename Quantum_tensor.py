import sys
import numpy as np

def tensor_product(q1, q2):
    """Calcule le produit tensoriel de deux qubits."""
    # États de base des qubits |0⟩ et |1⟩
    qubits = {
        "0": np.array([[1], [0]]),
        "1": np.array([[0], [1]])
    }

    if q1 not in qubits or q2 not in qubits:
        return "Erreur : Entrée invalide"

    # Produit tensoriel
    tensor = np.kron(qubits[q1], qubits[q2])

    # Affichage du résultat
    result_str = f"|{q1}⟩ ⊗ |{q2}⟩ = {tensor}"
    return result_str

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Erreur : Veuillez entrer deux qubits (0 ou 1).")
    else:
        q1, q2 = sys.argv[1], sys.argv[2]
        print(tensor_product(q1, q2))

    # Écriture du résultat dans un fichier
    with open("result.txt", "w") as f:
        f.write(output)

    # Affichage pour debug (pas nécessaire en COBOL)
    print(output)
