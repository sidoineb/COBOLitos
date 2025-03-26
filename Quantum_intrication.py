import sys
import numpy as np

def bell_state(q1, q2):
    """Génère un état intriqué à partir de deux qubits d'entrée."""
    if q1 not in ["0", "1"] or q2 not in ["0", "1"]:
        return "Erreur : Entrée invalide (doit être 0 ou 1)"

    # États de base |0⟩ et |1⟩
    zero = np.array([[1], [0]])
    one = np.array([[0], [1]])

    # Superposition de Bell : (|00⟩ + |11⟩) / sqrt(2)
    bell_00 = (np.kron(zero, zero) + np.kron(one, one)) / np.sqrt(2)
    
    result_str = f"État de Bell pour ({q1}, {q2}):\n{bell_00}"
    return result_str

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Erreur : Veuillez entrer deux qubits (0 ou 1).")
    else:
        q1, q2 = sys.argv[1], sys.argv[2]
        print(bell_state(q1, q2))

    # Écriture du résultat dans un fichier
    with open("result.txt", "w") as f:
        f.write(output)

    # Affichage pour debug (pas nécessaire en COBOL)
    print(output)