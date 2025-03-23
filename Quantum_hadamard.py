import sys
import numpy as np

# Définition de la matrice Hadamard
HADAMARD_GATE = (1 / np.sqrt(2)) * np.array([[1, 1], [1, -1]])

def apply_hadamard(qubit):
    """Applique la porte Hadamard à un qubit donné (0 ou 1)."""
    qubits = {
        "0": np.array([[1], [0]]),  # Qubit |0⟩
        "1": np.array([[0], [1]])   # Qubit |1⟩
    }

    if qubit not in qubits:
        return "Erreur : Entrée invalide (doit être 0 ou 1)"

    # Application de la transformation Hadamard
    result = np.dot(HADAMARD_GATE, qubits[qubit])
    
    # Construction du résultat sous une forme lisible
    result_str = f"H(|{qubit}⟩) = {result}"
    return result_str

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Erreur : Veuillez entrer un qubit (0 ou 1).")
    else:
        qubit = sys.argv[1]
        print(apply_hadamard(qubit))