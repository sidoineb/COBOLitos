import sys
import numpy as np

# Définition des matrices de portes quantiques
PAULI_X = np.array([[0, 1], [1, 0]])  # Équivalent du NOT
PAULI_Z = np.array([[1, 0], [0, -1]]) # Change la phase de |1⟩
CNOT = np.array([[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 1, 0]]) # Opère sur deux qubits

def apply_gate(gate, qubits):
    """Applique une porte quantique à un qubit ou une paire de qubits."""
    qubit_states = {
        "0": np.array([[1], [0]]),
        "1": np.array([[0], [1]])
    }

    if gate in ["X", "Z"]:
        if qubits[0] not in qubit_states:
            return "Erreur : Entrée invalide (doit être 0 ou 1)"
        result = np.dot(PAULI_X if gate == "X" else PAULI_Z, qubit_states[qubits[0]])
        return f"{gate} |{qubits[0]}⟩ = {result}"

    elif gate == "CNOT":
        if len(qubits) < 2 or qubits[0] not in qubit_states or qubits[1] not in qubit_states:
            return "Erreur : Deux qubits valides sont requis."
        # Produit tensoriel des qubits d'entrée
        input_state = np.kron(qubit_states[qubits[0]], qubit_states[qubits[1]])
        result = np.dot(CNOT, input_state)
        return f"CNOT |{qubits[0]}{qubits[1]}⟩ = {result}"

    else:
        return "Erreur : Porte inconnue."

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage : python3 quantum_gates.py [X|Z|CNOT] QUBIT1 [QUBIT2]")
    else:
        gate = sys.argv[1]
        qubits = sys.argv[2:]
        print(apply_gate(gate, qubits))

        # Écriture du résultat dans un fichier
    with open("result.txt", "w") as f:
        f.write(output)

    # Affichage pour debug (pas nécessaire en COBOL)
    print(output)
